class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name
      t.boolean :admin
      t.references :group, index: true

      t.timestamps null: false
    end
    add_foreign_key :members, :groups
  end
end
