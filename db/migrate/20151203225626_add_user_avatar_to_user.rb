class AddUserAvatarToUser < ActiveRecord::Migration
  def change
    add_column :users, :user_avatar, :integer
    add_column :answers, :user_avatar, :integer
  end
end
