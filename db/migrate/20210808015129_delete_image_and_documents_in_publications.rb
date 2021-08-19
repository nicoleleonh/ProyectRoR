class DeleteImageAndDocumentsInPublications < ActiveRecord::Migration[5.2]
  def change
    remove_column :publications, :image
    remove_column :publications, :documents
  end
end
