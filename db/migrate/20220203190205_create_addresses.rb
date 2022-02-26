class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :city
      t.references :contact, foreign_key: true, default: 1

      t.timestamps
    end
  end
end
