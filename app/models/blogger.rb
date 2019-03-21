class Blogger < ApplicationRecord
has_many :posts
has_many :destinations, through: :posts

validates :name, uniqueness: true
validates :bio, length: {minimum: 30}
end
