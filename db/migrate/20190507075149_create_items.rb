class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :WAREHOUSE
      t.string :ITEM_NUMBER
      t.string :ITEM_DESCRIPTION
      t.string :DEPARTMENT
      t.string :PCLASS
      t.string :ITEM_SIZE
      t.integer :STORE_PACK
      t.string :BSP
      t.string :RSP
      t.integer :ZONE

      t.timestamps
    end
  end

  # t.string "WAREHOUSE"
  # t.integer "ITEM_NUMBER"
  # t.string "ITEM_DESCRIPTION"
  # t.string "DEPARTMENT"
  # t.string "PCLASS"
  # t.string "ITEM_SIZE"
  # t.integer "STORE_PACK"
  # t.string "BSP"
  # t.string "RSP"
  # t.integer "ZONE"

  # t.string :WAREHOUSE
  #     t.integer :ITEM_NUMBER
  #     t.string :ITEM_DESCRIPTION:
  #     t.string :DEPARTMENT
  #     t.string :PCLASS
  #     t.string :ITEM_SIZE
  #     t.integer :STORE_PACK
  #     t.string :BSP
  #     t.string :RSP
  #     t.integer :ZONE
end
