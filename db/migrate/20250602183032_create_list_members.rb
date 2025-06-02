class CreateListMembers < ActiveRecord::Migration[8.0]
  def change
    create_table :list_members do |t|
      t.references :user, null: false, foreign_key: true
      t.references :list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
