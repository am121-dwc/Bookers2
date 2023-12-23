class AddDeviseCreateUserToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :introduction, :text
    t.integer :user_id
  end
end
