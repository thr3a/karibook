class Kashidashi < ActiveRecord::Base
  belongs_to :book, primary_key: :isbn, foreign_key: :isbn
  belongs_to :user, foreign_key: :user_id

  validates :isbn, presence: true
  validates :user_id, presence: true
  validate :isvalid_book
  validate :isvalid_user

  def isvalid_book
    b = Book.find_by(isbn: isbn)
    if b.nil?
      errors.add(:isbn, "は登録されていない本です")
    elsif(b.kashidashi.present? && b.kashidashi.user_id != user_id)
      errors.add(:isbn, "は誰かが既に借りている本です")
    end
  end

  def isvalid_user
    if User.find_by(id: user_id).nil?
      errors.add(:user_id, "は登録されていないユーザーです")
    end
  end
end
