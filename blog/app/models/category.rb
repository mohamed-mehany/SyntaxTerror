class Category < ActiveRecord::Base
  validates_presence_of :name
  has_many :categoriesposts
  has_many :posts, :through => :categoriesposts
end
