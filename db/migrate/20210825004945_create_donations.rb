class CreateDonations < ActiveRecord::Migration[5.2]
  def change
    create_table :donations do |t|
      t.references :publication, foreign_key: true
      t.references :user, foreign_key: true


      t.timestamps
    end
  end
end
