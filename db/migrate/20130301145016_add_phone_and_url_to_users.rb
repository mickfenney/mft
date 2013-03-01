class AddPhoneAndUrlToUsers < ActiveRecord::Migration
  def change
    add_column :users, :phone, :string

    add_column :users, :url, :string

  end
end
