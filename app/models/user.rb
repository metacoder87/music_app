class User < ApplicationRecord
    validates :email, :session_token, presence: true, uniqueness: true
    validates :password_digest, presence: { message: "Password can not be blank"}
    validates :password, length: { minimum: 6, allow_nil: true }
end
