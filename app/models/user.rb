class User < ApplicationRecord
    has_many :categories, through: :groups
    has_many :groups
    has_many :cards, through: :groups
    
    has_secure_password

    validates :password, :presence => true,
    :confirmation => true,
    :length => {:within => 6..40},
    :on => :create

    # email validations
    # name validations

end
