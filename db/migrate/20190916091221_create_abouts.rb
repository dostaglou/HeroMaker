class CreateAbouts < ActiveRecord::Migration[5.2]
  def change
    create_table :abouts do |t|
      t.references :user, foreign_key: true
      t.text :about

      t.timestamps
    end
  end
end
