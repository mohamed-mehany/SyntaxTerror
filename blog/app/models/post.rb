class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  has_many :categoriesposts
  has_many :categories, through: :categoriesposts

  validates :user_id, presence: true
  validates :title, presence: true
  validates :content, length: { minimum: 100 }

  def self.cat_with(name)
    Category.find_by_name!(name).posts
  end

  def self.cat_counts
    Category.select("categories.*, count(categoriesposts.category_id) as count").
      joins(:categoriesposts).group("categoriesposts.category_id")
  end

  def cat_list
    categories.map(&:name).join(", ")
  end

  def cat_list=(names)
    self.categories = names.split(",").map do |n|
      Category.where(name: n.strip).first_or_create!
    end
  end

  def to_s
    title
  end
end
