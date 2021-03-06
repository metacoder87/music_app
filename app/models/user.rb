class User < ApplicationRecord
    validates :email, :session_token, presence: true, uniqueness: true
    validates :password_digest, presence: { message: "Password can not be blank"}
    validates :password, length: { minimum: 6, allow_nil: true }
    after_initialize :ensure_session_token

    attr_reader :password

    def self.find_by_credentials(email, password)
        user = User.find_by(email: email)
        return nil if user.nil?
        user.is_password?(password) ? user : nil
    end

    def self.generate_session_token
        SecureRandom.urlsafe_base64(16)
    end

    def reset_session_token!
        self.session_token = self.generate_session_token
        self.save!
        self.session_token
    end

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    def is_password?(password)
        BCrypt::Password.new(password_digest).is_password?(password)
    end

private

    def ensure_session_token
        self.session_token ||= self.generate_session_token
    end

end