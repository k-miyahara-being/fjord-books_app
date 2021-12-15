# frozen_string_literal: true

class AddAdressToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :postal_code, :integer
    add_column :users, :prefecture, :string
    add_column :users, :city, :string
    add_column :users, :town, :string
    add_column :users, :introduction, :text
    add_column :users, :username, :string
  end
end
