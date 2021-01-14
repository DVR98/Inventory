json.extract! item, :id,
                    :WAREHOUSE, 
                    :ITEM_NUMBER, 
                    :ITEM_DESCRIPTION,
                    :DEPARTMENT,
                    :PCLASS,
                    :ITEM_SIZE,
                    :STORE_PACK,
                    :BSP,
                    :RSP,
                    :ZONE,
                    :created_at, 
                    :updated_at
json.url item_url(item, format: :json)
