class AddAvailableToPublications < ActiveRecord::Migration[5.2]
  def change
    add_column :publications, :available, :boolean, default: true
  end
end
