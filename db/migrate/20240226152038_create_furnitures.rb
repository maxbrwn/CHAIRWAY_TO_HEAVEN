class CreateFurnitures < ActiveRecord::Migration[7.1]
  def change
    create_table :furnitures do |t|
      t.string :title
      t.string :address
      t.text :description
      t.text :condition
      t.boolean :availability
      t.string :category
      t.float :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
