class Category < ApplicationRecord
    has_many :groups
    has_many :users, through: :groups

    ##validations
    #title present
end
