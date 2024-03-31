class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.string :client_name, null: false
      t.text :description, null: false
      t.date :delivery_date, null: false
      t.string :delivery_hour, null: false
      t.boolean :ready, null: false, default: false
      t.decimal :value, null: false

      t.timestamps
    end
  end
end
