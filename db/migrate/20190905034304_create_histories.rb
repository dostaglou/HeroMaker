class CreateHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :histories do |t|
      t.references :character, foreign_key: true
      t.text :story
      t.string :timeperiod

      t.timestamps
    end
  end
end
