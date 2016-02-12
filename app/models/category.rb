class Category < ActiveRecord::Base
  has_many :post_categories
  has_many :posts, through: :post_categories

  enum status: { disable: 0, enable: 1 }
end