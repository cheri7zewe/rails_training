require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter:  "sqlite3",
  database: "db/song_list.sqlite"
)

ActiveRecord::Base.logger = Logger.new(STDOUT)

class CreateSongsMigration < ActiveRecord::Migration[4.2]
	def change
		create_table :songs do |table|
			table.string :name
			table.integer :runtime
			table.integer :artist_id
		end

		create_table :artists do |table|
			table.string :name
		end
	end
end

CreateSongsMigration.migrate(:down)
CreateSongsMigration.migrate(:up)

class Song < ActiveRecord::Base
	validates :name, presence: true
	validates :name, uniqueness: true
	validates :runtime, numericality: true
	validates :runtime, numericality: { greater_than: 10 }

	has_one :artist
end

class Artist < ActiveRecord::Base
	has_many :songs 
end

artist = Artist.create!({name: "Billy Joel"})

Song.create!({ name: "Allentown", runtime: 432, artist: artist})
Song.create!({ name: "Uptown Girl", runtime: 654, artist: artist})
Song.create!({ name: "Goodnight Saigon", runtime: 200, artist: artist})

song = Song.new
song.name = "Honesty"
song.runtime = 454
song.save