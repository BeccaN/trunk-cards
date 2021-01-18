class User < ApplicationRecord
    has_many :categories, through: :groups
    has_many :groups
    has_many :cards, through: :groups
    
    has_secure_password

    validates :password, :presence => true,
    :confirmation => true,
    :length => {:within => 6..40},
    :on => :create

    validates :email, :presence => true

    validates :name, :presence => true,
    :length => {:within => 6..10}
    
end

#'/users/:id/groups'
