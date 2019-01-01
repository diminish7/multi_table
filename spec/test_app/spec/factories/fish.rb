# frozen_string_literal: true

FactoryBot.define do
  factory :fish do
    name 'Nemo'

    trait :freshwater do
      freshwater true
    end

    trait :saltwater do
      freshwater false
    end
  end
end
