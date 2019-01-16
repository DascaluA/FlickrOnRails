class AddUserIdToAlbum < ActiveRecord::Migration[5.2]
  def change
    add_column :albums, :user_id, :integer
    add_column :comments, :picture_id, :integer
  end
end
