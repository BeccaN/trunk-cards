class User < ApplicationRecord
    has_many :categories, through: :groups
    has_many :groups
    has_many :cards, through: :groups
    
    has_secure_password

    validates :password, :presence => true,
    :length => {minimum: 6}

    validates :email, :presence => true,
    :uniqueness => true

    validates :name, :presence => true,
    :length => {minimum: 6}
    
    def self.github_omniauth(auth)
        self.find_or_create_by(email: auth[:info][:email]) do |user|
            user.name = auth[:info][:nickname]
            user.password = SecureRandom.hex(20)
        end
    end
end