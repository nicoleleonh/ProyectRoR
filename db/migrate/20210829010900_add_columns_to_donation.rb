class AddColumnsToDonation < ActiveRecord::Migration[5.2]
  def change
    add_column :donations, :paid, :boolean, default: false
    add_column :donations, :token, :string

  end
end
