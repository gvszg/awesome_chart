class Comment < ActiveRecord::Base
  scope :recent, -> { order(id: :desc) }

  enum status: { disable: 0, enable: 1 }

  validates_presence_of(:title, :content)

  before_create do
    self.key = SecureRandom.hex
  end
end