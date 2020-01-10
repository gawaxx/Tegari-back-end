class User < ApplicationRecord
    has_secure_password
    validates :user_name, uniqueness: { case_sensitive: false }
    has_many :posts
    has_many :save_posts

    # def authenticate(plaintext_password)
    #     if BCrypt::Password.new(self.password_digest) == plaintext_password
    #       self
    #     else
    #       false
    #     end
    # end

end
