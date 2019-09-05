class CreateCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :allies
      t.string :enemies
      t.string :description
      t.references :user, foreign_key: true
      t.references :race, foreign_key: true
      t.references :gender, foreign_key: true
      t.references :profession, foreign_key: true

      t.timestamps
    end
  end
end
