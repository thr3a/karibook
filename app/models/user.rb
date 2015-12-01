class User < ActiveRecord::Base
  has_one :kashidashi, dependent: :destroy
  validates :name, presence: true
  validates :id, presence: true, uniqueness: true
end
