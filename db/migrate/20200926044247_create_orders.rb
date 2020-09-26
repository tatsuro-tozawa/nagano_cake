class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :client_id
      t.string :address
      t.string :postcode
      t.string :name
      t.integer :payment_method
      t.integer :total_payment
      t.integer :postage
      t.integer :status

      t.timestamps
    end
  end
end
