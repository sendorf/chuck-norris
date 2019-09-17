# frozen_string_literal: true

# Chuck Norris joke's category
class Category < ApplicationRecord
  has_and_belongs_to_many :jokes
end
