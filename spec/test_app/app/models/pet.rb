# frozen_string_literal: true

class Pet < ApplicationRecord
  include MultiTable

  validates :name, presence: true
end
