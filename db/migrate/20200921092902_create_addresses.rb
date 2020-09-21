class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :client_id
      t.string :address
      t.string :postcode
      t.string :name

      t.timestamps
    end
  end
end
