class CreateLists < ActiveRecord::Migration[8.0]
  def change
    create_table :lists do |t|
      t.string :name
      t.integer :order
      t.references :owner, null: false, foreign_key: true

      t.timestamps
    end
  end
end
