class AddColorIdToMembers < ActiveRecord::Migration
  def change
    add_column :members, :color_id, :integer
  end
end
