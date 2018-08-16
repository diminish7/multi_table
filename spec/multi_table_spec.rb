# frozen_string_literal: true

RSpec.describe MultiTable, type: :model do
  describe 'base class' do
    context 'validations' do
      subject { build(:pet) }

      it { is_expected.to validate_presence_of(:name) }
    end
  end

  describe 'sub class' do
    subject { build(:dog) }

    it { is_expected.to be_a(Pet) }
    it { is_expected.to validate_presence_of(:name) }
  end
end
