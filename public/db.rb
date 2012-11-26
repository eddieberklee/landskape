require 'active_record'
require 'uri'
require 'pg'

puts 'I am a db and should be run'

db = URI.parse(ENV['DATABASE_URL'] || 'postgres://ec2-23-21-161-255.compute-1.amazonaws.com/ddqa61sv0v5pnm')

puts db;
#database = 'ddqa61sv0v5pnm';
#host = 'ec2-23-21-161-255.compute-1.amazonaws.com';
db.port = 5432;
#db.user = 'xpvzwbwbbksqvx';
#db.password = 'Wt5HmBrhT0XqpQoBF2RUBODKdr';
db.user = 'xpvzwbwbbksqvx';
db.password = 'Wt5HmBrhT0XqpQoBF2RUBODKdr';

ActiveRecord::Base.establish_connection(
    :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
    :host     => db.host,
    :port     => db.port,
    :username => db.user,
    :password => db.password,
    :database => db.path[1..-1],
    :encoding => 'utf8'
)

ActiveRecord::Schema.define do
  if (!table_exists?(:users))
    create_table :users do |table|
      table.column :username, :string
      table.column :password, :string
    end
  end

  if (!table_exists?(:photos))
    create_table :photos do |table|
      table.column :title, :string
      table.column :description, :string
      table.column :city, :string
      table.column :country, :string
      table.column :state, :string
      table.column :file_location, :string
    end
  end

  if (!table_exists?(:comments))
    create_table :comments do |table|
      table.column :comment, :string
    end
  end

  if (!table_exists?(:likes))
    create_table :likes do |table|
      table.column :comment, :string
    end
  end
end

class User < ActiveRecord::Base
  has_many :photos
  has_many :comments
  has_many :likes
end

class Photo < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :likes
end

class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :photo
end

class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :photo
end

user = User.create(:username => 'James', :password => 'gobears')
photo = user.photos.create(:title => 'El Capitan', :description => 'So beautiful etc.',
                           :city => 'Yosemite', :country => 'USA', :state => 'CA',
                           :file_location => '/pics/elcapitan.png')

#album = Album.create(:title => 'Black and Blue',
#                     :performer => 'The Rolling Stones')
#album.tracks.create(:track_number => 1, :title => 'Hot Stuff')
#album.tracks.create(:track_number => 2, :title => 'Hand Of Fate')
#album.tracks.create(:track_number => 3, :title => 'Cherry Oh Baby ')
#album.tracks.create(:track_number => 4, :title => 'Memory Motel ')
#album.tracks.create(:track_number => 5, :title => 'Hey Negrita')
#album.tracks.create(:track_number => 6, :title => 'Fool To Cry')
#album.tracks.create(:track_number => 7, :title => 'Crazy Mama')
#album.tracks.create(:track_number => 8,
#                    :title => 'Melody (Inspiration By Billy Preston)')
#
#album = Album.create(:title => 'Sticky Fingers',
#                     :performer => 'The Rolling Stones')
#album.tracks.create(:track_number => 1, :title => 'Brown Sugar')
#album.tracks.create(:track_number => 2, :title => 'Sway')
#album.tracks.create(:track_number => 3, :title => 'Wild Horses')
#album.tracks.create(:track_number => 4,
#                    :title => 'Can\'t You Hear Me Knocking')
#album.tracks.create(:track_number => 5, :title => 'You Gotta Move')
#album.tracks.create(:track_number => 6, :title => 'Bitch')
#album.tracks.create(:track_number => 7, :title => 'I Got The Blues')
#album.tracks.create(:track_number => 8, :title => 'Sister Morphine')
#album.tracks.create(:track_number => 9, :title => 'Dead Flowers')
#album.tracks.create(:track_number => 10, :title => 'Moonlight Mile')
#
#puts Album.find(1).tracks.length
#puts Album.find(2).tracks.length
#
#puts Album.find_by_title('Sticky Fingers').title
#puts Track.find_by_title('Fool To Cry').album_id
