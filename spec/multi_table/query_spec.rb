# frozen_string_literal: true

RSpec.describe MultiTable::SubclassQuery, type: :model do
  describe '.all' do
    let!(:dog) { create(:dog) }
    let!(:fish) { create(:fish) }

    context 'against the base class' do
      subject { Pet.all }

      it { is_expected.to include(dog) }
      it { is_expected.to include(fish) }
    end

    context 'against a subclass' do
      subject { Fish.all }

      it { is_expected.to include(fish) }
      it { is_expected.to_not include(dog) }
    end
  end

  describe '.where' do
    let!(:dog) { create(:dog) }
    let!(:freshwater_fish) { create(:fish, :freshwater) }
    let!(:saltwater_fish) { create(:fish, :saltwater) }

    context 'against the base class' do
      it 'does not allow queries against subclass table columns' do
        expect { Pet.where(freshwater: true).to_a }.to raise_error(ActiveRecord::StatementInvalid)
      end
    end

    context 'against a subclass' do
      it 'allows queries against the subclass table columns' do
        expect(Fish.where(freshwater: true)).to eq([freshwater_fish])
      end
    end
  end
end
