class Group < ApplicationRecord
    has_many :cards
    belongs_to :category
    belongs_to :user

    ##validations
    #presence true for title and description
end
