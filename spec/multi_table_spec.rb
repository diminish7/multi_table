# frozen_string_literal: true

RSpec.describe MultiTable, type: :model do
  describe 'base class' do
    context 'validations' do
      subject { build(:pet) }

      it { is_expected.to validate_presence_of(:name) }
      it { is_expected.to_not respond_to(:breed) }
    end
  end

  describe 'sub class' do
    subject { build(:dog, breed: 'German Shepherd') }

    it { is_expected.to be_a(Pet) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to respond_to(:breed) }

    it 'auto-generates the `multi_table` association' do
      expect(subject.multi_table).to be_present
    end

    it 'persists the secondary table' do
      expect(subject.breed).to eq('German Shepherd')

      expect do
        expect do
          subject.save
        end.to change(Dog, :count).by(1)
      end.to change(Dog.polymorphic_class, :count).by(1)

      expect(subject.reload.breed).to eq('German Shepherd')
    end
  end
end
