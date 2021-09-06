class AddDetailsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :zip_code, :integer
    add_column :users, :address, :string
    add_column :users, :self_introduction, :text
  end
end
