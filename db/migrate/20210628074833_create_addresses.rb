class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|

      t.string :postal_code,      null: false
      t.integer :region_id,       null: false
      t.string :city,             null: false
      t.string :house_number,     null: false
      t.string :floor
      t.string :telephone_number, null: false
      t.references :order,        null: false, foreign_key: true
      t.timestamps

    end
  end
end
