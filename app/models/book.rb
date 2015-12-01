class Book < ActiveRecord::Base
  has_one :kashidashi, foreign_key: :isbn, dependent: :destroy

  validates :isbn, presence: true, uniqueness: true, length: { is: 13 }
  validates :name, presence: true, uniqueness: true
  validates :author, presence: true
  validates :publisher, presence: true
  validates :published_date, presence: true
end
