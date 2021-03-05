class Videogame < ActiveRecord::Base
    belongs_to :user
    validates :title, presence: true
    validates :date_purchased, presence: true
end