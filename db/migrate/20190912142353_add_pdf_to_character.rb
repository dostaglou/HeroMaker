class AddPdfToCharacter < ActiveRecord::Migration[5.2]
  def change
    add_column :characters, :pdf, :string
  end
end
