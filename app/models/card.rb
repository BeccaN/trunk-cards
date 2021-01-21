class Card < ApplicationRecord
    belongs_to :group

    # validates :front,:back, presence: true
end
