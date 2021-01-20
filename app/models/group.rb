class Group < ApplicationRecord
    has_many :cards
    belongs_to :category
    belongs_to :user

    validates :title, :description, presence: true
    
end
