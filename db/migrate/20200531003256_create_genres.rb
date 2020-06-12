class CreateGenres<ActiveRecord::Migration[5.2]
  
  def change
    create_table :genres do |t|
      t.string :name
    end
  end

end

#country=Genre.create(name: "country")
#pop=Genre.create(name: "pop")