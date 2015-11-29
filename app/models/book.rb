class Book < ActiveRecord::Base
  has_one :kashidashi, foreign_key: :isbn
end
