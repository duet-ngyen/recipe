class AddAvatarForChef < ActiveRecord::Migration
  def change
    add_column :chefs, :avatar, :string
  end
end
