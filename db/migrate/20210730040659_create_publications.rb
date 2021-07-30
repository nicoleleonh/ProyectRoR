class CreatePublications < ActiveRecord::Migration[5.2]
  def change
    create_table :publications do |t|
      t.string :name
      t.integer :age
      t.text :image
      t.text :description
      t.text :documents
      t.float :amountoraise
      t.float :amountcollected
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
