class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :rut
      t.string :business_name
      t.string :business_line
      t.string :address

      t.timestamps
    end
  end
end
