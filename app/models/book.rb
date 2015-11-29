class Book < ActiveRecord::Base
  has_one :kashidashi, foreign_key: :isbn, dependent: :destroy
end
