class CreateJoinTablePicturesCategories < ActiveRecord::Migration[5.2]
  def change
    create_join_table :pictures, :categories do |t|
      # t.index [:picture_id, :category_id]
      # t.index [:category_id, :picture_id]
    end
  end
end
