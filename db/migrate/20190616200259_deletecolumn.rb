class Deletecolumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :songs, :artists
  end
end
