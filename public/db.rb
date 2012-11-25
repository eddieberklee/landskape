require 'active_record'
require 'uri'

puts 'I am a db and should be run'

#db = URI.parse(ENV['DATABASE_URL'] || 'postgres://localhost/ddqa61sv0v5pnm')

database = 'ddqa61sv0v5pnm';
host = 'ec2-23-21-161-255.compute-1.amazonaws.com';
port = 5432;
user = 'xpvzwbwbbksqvx';
password = 'Wt5HmBrhT0XqpQoBF2RUBODKdr';

ActiveRecord::Base.establish_connection(
    :adapter  => 'postgresql',
    :host     => host,
    :port     => port,
    :username => user,
    :password => password,
    :database => database,
    :encoding => 'utf8'
)