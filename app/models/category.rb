class Category < ApplicationRecord
    has_many :groups
    has_many :users, through: :groups

    validates :name, presence: true
    validates_uniqueness_of :name, :case_sensitive => false

    scope :ordered_by_name, -> { reorder(name: :asc) }
    scope :search, -> (x) { where("name LIKE (?)", "%#{x}%") }
    
end
