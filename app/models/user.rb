class User < ApplicationRecord
   
    before_save { self.email = email.downcase }



    has_many :posts, dependent: :destroy
    validates :name, presence: true, 
                        uniqueness: { case_sensitive: false }, 
                        length: { minimum: 3, maximum: 25 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, 
                        uniqueness: { case_sensitive: false }, 
                        length: { maximum: 105 },
                        format: { with: VALID_EMAIL_REGEX }
    validates :password, confirmation: true, unless: -> { password.blank? },length: { in: 6..20 }
    has_secure_password
end
