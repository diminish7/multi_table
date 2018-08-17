# frozen_string_literal: true

RSpec.describe MultiTable::PolymorphicClassFactory, type: :model do
  class TheParentClass; end

  subject(:factory) { MultiTable::PolymorphicClassFactory.new(TheParentClass) }

  describe '#call' do
    subject { factory.call }

    it 'generates a new named class' do
      expect(subject).to be_a(Class)
      expect(subject.name).to eq('MultiTable::PolymorphicClass::TheParentClass')
    end
  end
end
