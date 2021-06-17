class AddSlugColumns < ActiveRecord::Migration[5.2]
  def change
    add_column :artists, :slug, :string
    add_column :songs, :slug, :string
    add_column :genres, :slug, :string
  end
end
