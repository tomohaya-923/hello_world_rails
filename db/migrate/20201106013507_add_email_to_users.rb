class AddEmailToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :emaill, :string
  end
end
