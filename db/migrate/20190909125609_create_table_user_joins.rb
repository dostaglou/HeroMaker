class CreateTableUserJoins < ActiveRecord::Migration[5.2]
  def change
    create_table :table_user_joins do |t|
      t.references :user, foreign_key: true
      t.references :table, foreign_key: true

      t.timestamps
    end
  end
end
