class AddProfilePictureToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :profile_picture, :text
  end
end
