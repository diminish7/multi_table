# frozen_string_literal: true

FactoryBot.define do
  factory :dog do
    name 'Spot'
    breed 'Poodle'

    trait :mix do
      mix true
    end

    trait :purebred do
      mix false
    end
  end
end
