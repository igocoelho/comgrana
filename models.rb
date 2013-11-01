require 'mongoid'

Mongoid.load!(File.dirname(__FILE__) + '/mongoid.yml', :development)

class User
  include Mongoid::Document

  field :name, :type => String
  field :email, :type => String
  field :password, :type => String
end

class Account
  include Mongoid::Document

  field :name, :type => String

  belongs_to :user
end

class Category
  include Mongoid::Document

  field :name, :type => String

  belongs_to :user
end

class Subcategory
  include Mongoid::Document

  field :name, :type => String

  belongs_to :category
end

class Transaction
  include Mongoid::Document

  field :description, :type => String
  field :date, :type => Date
  field :value, :type => Float
  field :type, :type => String

  belongs_to :account 
  belongs_to :category
end

class Goal
  include Mongoid::Document

  field :date, :type => Date
  field :value, :type => Float

  belongs_to :user
end