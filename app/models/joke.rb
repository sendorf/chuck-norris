# frozen_string_literal: true

# Chuck Norris joke
class Joke < ApplicationRecord
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :searches

  validates :api_id, uniqueness: true
end
