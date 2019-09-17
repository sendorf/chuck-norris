# frozen_string_literal: true

# Chuck Norris search
class Search < ApplicationRecord
  has_and_belongs_to_many :jokes
end
