class CreateFinancials < ActiveRecord::Migration[7.1]
  def change
    create_table :financials do |t|

      t.timestamps
    end
  end
end
