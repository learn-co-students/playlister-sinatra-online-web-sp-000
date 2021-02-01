class DropGenreidColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :songs, :gene_id
  end
end
