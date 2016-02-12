class Category < ActiveRecord::Base
  has_many :post_categories, dependent: :nullify # foreign key to be set to NULL
  has_many :posts, through: :post_categories, dependent: :nullify

  scope :recent, -> {order(id: :desc)}

  enum status: { disable: 0, enable: 1 }

  # before_create do
  #   self.key = SecureRandom.hex
  # end
end