class CreateArtists < ActiveRecord::Migration[5.1]
  def change() create_table(:artists) { |t| t.string :name } end
end