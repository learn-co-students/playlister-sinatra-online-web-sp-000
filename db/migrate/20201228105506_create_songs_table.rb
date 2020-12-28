class CreateSongsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.string :name
    end
  end
end

#drop/add to table
