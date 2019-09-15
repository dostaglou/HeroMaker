class AddSynopisisToStories < ActiveRecord::Migration[5.2]
  def change
    add_column :stories, :synopsis, :text
  end
end
