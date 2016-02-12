class Post < ActiveRecord::Base
  enum status: { disable: 0, enable: 1 }
end