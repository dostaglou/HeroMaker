class AddPictureToTable < ActiveRecord::Migration[5.2]
  def change
    add_column :tables, :picture, :string
  end
end
