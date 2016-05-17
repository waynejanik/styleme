class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :product
      t.decimal :price
      t.text :description

      t.timestamps null: false
    end
  end
end
