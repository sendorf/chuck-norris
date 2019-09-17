# frozen_string_literal: true

# Default behaviour for active record
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
