class AlterLikes < ActiveRecord::Migration[5.2]
  def change
    remove_column(:likes, :artwork_id)
    remove_column(:likes, :comment_id)
    add_column(:likes, :user_id, :integer, null: false)
  end
end
