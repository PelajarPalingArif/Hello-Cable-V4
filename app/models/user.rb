class User < ApplicationRecord
    has_secure_password
    has_many :messages, dependent: :destroy
  
    # Validations
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :name, presence: true, length: { minimum: 2, maximum: 50 }
    validates :password, presence: true, length: { minimum: 6 }, if: :password_digest_changed?

  end
  