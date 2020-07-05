class Divelog < ApplicationRecord
    belongs_to :user
    validates :location, :divesite, presence: true
end
