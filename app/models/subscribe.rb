class Subscribe < ActiveRecord::Base
  validates_presence_of :email
  validates_format_of :email, with: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  validates_presence_of :amount
  validates_numericality_of :amount, only_integer: true, greater_than: 1

  scope :recent, -> { order(id: :desc) }
end