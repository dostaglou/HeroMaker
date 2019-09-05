class AddPictureToCharacters < ActiveRecord::Migration[5.2]
  def change
    add_column :characters, :picture, :string
  end
end
