class Group < ApplicationRecord
    has_many :cards, dependent: :destroy
    belongs_to :category
    belongs_to :user

    accepts_nested_attributes_for :category, reject_if: proc { |attributes| attributes['name'].blank? }
    accepts_nested_attributes_for :cards

    validates :title, :description, presence: true

    scope :ordered_by_create, -> { order('created_at DESC') }

    def category_attributes=(attributes)
        if attributes["name"].present?
            category = Category.find_or_create_by(name: attributes["name"])
            self.category = category
        end 
    end

    def cards_attributes=(attributes)
        attributes.values.each do |a|
            if !a["front"].blank? || !a["back"].blank?
                card = Card.create(front: a["front"], back: a["back"])
                self.cards << card
            end
        end
    end  
end
