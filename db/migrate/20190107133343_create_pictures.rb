class CreatePictures < ActiveRecord::Migration[5.2]
  def change
    create_table :pictures do |t|
      t.string :title
      t.string :description
      t.integer :score

      t.timestamps
    end
  end
end
