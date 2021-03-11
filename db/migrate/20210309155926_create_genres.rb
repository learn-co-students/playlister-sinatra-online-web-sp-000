class CreateGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :genres do |col|
      col.string :name
    end
  end
end
