class Category < ActiveRecord::Base
  validates_presence_of :name
  has_many :categoriesposts
  has_many :posts, through: :categoriesposts

  validates :name, presence: true, uniqueness: true
  def to_s
    name
  end
end
