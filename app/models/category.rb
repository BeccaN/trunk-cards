class Category < ApplicationRecord
    has_many :groups
    has_many :users, through: :groups

    validates :name, presence: true
    validates :name, uniqueness: true
end
