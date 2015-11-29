class User < ActiveRecord::Base
  has_one :kashidashi, dependent: :destroy
end
