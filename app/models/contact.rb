class Contact < ApplicationRecord
  before_save :downcase_email
  # validation
  validates :company, :name, :email, :tel, :opportunity_to_know,
            presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, format: {with: VALID_EMAIL_REGEX}
  validates :opportunity_to_know_other, length: {maximum: 50}
  validates :content, presence: true, length: {maximum: 1000}



  private
    def downcase_email
      email.downcase!
    end
end
