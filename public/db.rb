require 'active_record'
require 'uri'

puts 'I am a db and should be run'

db = URI.parse(ENV['DATABASE_URL'] || 'postgres://localhost/mydb')

puts db.user
puts db.password

ActiveRecord::Base.establish_connection(
    :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
    :host     => db.host,
    :port     => db.port,
    :username => db.user,
    :password => db.password,
    :database => db.path[1..-1],
    :encoding => 'utf8'
)