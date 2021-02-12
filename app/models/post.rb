class Post < ActiveRecord::Base
    attr_accessor :name, :year_completed
    belongs_to :user
end