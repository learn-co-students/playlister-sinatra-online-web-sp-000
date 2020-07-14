class CreateSongs < ActiveRecord::Migration[5.1]
  def change() create_table(:songs) { |t| t.string :name } end
end
