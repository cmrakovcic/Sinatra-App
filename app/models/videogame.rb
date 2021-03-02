class Videogame < ActiveRecord::Base

    validates :title, presence: true
    validates :date_purchased, presence: true
    belongs_to :user
end