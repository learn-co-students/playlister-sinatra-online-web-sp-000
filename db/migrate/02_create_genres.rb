class CreateGenres < ActiveRecord::Migration[5.1]
  def change() create_table(:genres) { |t| t.string :name } end
end
