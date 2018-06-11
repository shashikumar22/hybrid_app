class AddPhoneNoRoleAndCityAndCountryToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :phone_no, :string
    add_column :users, :city, :string
    add_column :users, :country, :string
    add_column :users, :role, :string
  end
end
