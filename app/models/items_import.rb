class ItemsImport
    include ActiveModel::Model
    require 'roo'
  
    attr_accessor :file
  
    def initialize(attributes={})
      attributes.each { |name, value| send("#{name}=", value) }
    end
  
    def persisted?
      false
    end
  
    def open_spreadsheet
      case File.extname(file.original_filename)
      when ".csv" then Csv.new(file.path, nil, :ignore)
      when ".CSV" then Csv.new(file.path, nil, :ignore)
      when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
      when ".XLS" then Roo::Excel.new(file.path, nil, :ignore)
      when ".xlsx" then Roo::Excelx.new(file.path)
      when ".XLSX" then Roo::Excelx.new(file.path)
      else raise "Unknown file type: #{file.original_filename}"
      end
    end

    def load_imported_items
      spreadsheet = open_spreadsheet
      header = spreadsheet.row(1)
      (2..spreadsheet.last_row).map do |i|
        row = Hash[[header, spreadsheet.row(i)].transpose]
        item = Item.find_or_create_by(ITEM_NUMBER:row["ITEM_NUMBER"])
        item.update(WAREHOUSE:row["WAREHOUSE"], 
                    ITEM_NUMBER:row["ITEM_NUMBER"], 
                    ITEM_DESCRIPTION:row["ITEM_DESCRIPTION"],
                    DEPARTMENT:row["DEPARTMENT"],
                    PCLASS:row["PCLASS"],
                    ITEM_SIZE:row["ITEM_SIZE"],
                    STORE_PACK:row["STORE_PACK"],
                    BSP:row["BSP"],
                    RSP:row["RSP"],
                    ZONE:row["ZONE"])
        item.attributes = row.to_hash
        item
      end
    end
  
    def imported_items
      @imported_items ||= load_imported_items
    end
  
    def save
        if imported_items.map(&:valid?).all?
          imported_items.each(&:save!)
          true
        else
          imported_items.each_with_index do |item, index|
            item.errors.full_messages.each do |msg|
              errors.add :base, "Row #{index + 6}: #{msg}"
            end
          end
          false
        end
      end
  end