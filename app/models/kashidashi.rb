class Kashidashi < ActiveRecord::Base
  belongs_to :book, primary_key: :isbn, foreign_key: :isbn
  belongs_to :user, foreign_key: :user_id
end
