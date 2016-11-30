require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'module'

class Link
  include DataMapper::Resource

  property :id, Serial
  property :title, String
  property :url, String

  ConnectApptoDB.start_db_connection
end
