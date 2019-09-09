class CreateBiographies < ActiveRecord::Migration[5.2]
  def change
    create_table :biographies do |t|
      t.text :chapter
      t.string :title
      t.references :character, foreign_key: true

      t.timestamps
    end
  end
end
