class Book < ApplicationRecord
    validates :author, presence: true
    validates :price, presence: true
    validates :published_date, presence: true
end
