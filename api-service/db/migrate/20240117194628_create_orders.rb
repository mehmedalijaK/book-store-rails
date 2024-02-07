class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.string :status
      t.datetime :ordered_at
      t.datetime :scheduled_at
      t.text :address
      t.text :phone
      t.text :full_name

      t.timestamps
    end
  end
end
