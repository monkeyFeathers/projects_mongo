require 'rubygems'
require 'mongo_mapper'

MongoMapper.connection = Mongo::Connection.new
MongoMapper.database = 'projects_mongo'

class Series
  include MongoMapper::EmbeddedDocument
  key :name, String
end

class Project
  include MongoMapper::EmbeddedDocument

  key :name, String
  key :description, String
  many :lobs, :as => :lobbable
  many :deliverables
  belongs_to :activity_type
end

class Lob
  include MongoMapper::Document
  
  key :name, String
  key :charge_code, String
  belongs_to :lobbable
end

class Deliverable
  include MongoMapper::EmbeddedDocument
  
  key :name, String
  key :due_date, Date
  key :completion, Date
  key :cost, Float
  key :est_month, Date
  belongs_to :project
  many :lobs, :as => :lobbable
end

class Activity_type
  include MongoMapper::Document
  
  key :name, String
  key :charge_code, String
  
  many :projects
end