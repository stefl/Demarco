Mongoid.skip_version_check = true

# Connection.new takes host, port
port = Mongo::Connection::DEFAULT_PORT

case Padrino.env
  when :development then
    connection = Mongo::Connection.new("localhost", port, {:pool_timeout => 60, :pool_size => 5, :timeout => 10})
    Mongoid.database = connection.db("demarco_development")
  when :production then
    uri  = URI.parse(ENV['MONGOLAB_URI'])
    connection = Mongo::Connection.from_uri(ENV['MONGOLAB_URI'], {:pool_timeout => 60, :pool_size => 5, :timeout => 10})
    Mongoid.database = connection.db(uri.path.gsub(/^\//, ''))
end

MONGO_CONNECTION = connection

# mongorestore -h ds033107.mongolab.com:33107 -d heroku_app4307410 -u demarco -p d3m4rc0! 