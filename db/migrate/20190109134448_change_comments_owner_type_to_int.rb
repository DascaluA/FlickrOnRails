class ChangeCommentsOwnerTypeToInt < ActiveRecord::Migration[5.2]
  def change
    change_column :comments, :owner, 'integer USING CAST(owner AS integer)'
  end
end
