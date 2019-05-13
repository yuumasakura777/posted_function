class AddUserIdToImgposts < ActiveRecord::Migration[5.2]
  def change
    add_column :imgposts, :user_id, :string
  end
end
