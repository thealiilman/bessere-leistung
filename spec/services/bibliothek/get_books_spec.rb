require 'rails_helper'

describe Bibliothek::GetBooks, type: :service do
  describe '.run' do
    context 'let vs let!' do
      # On average, it takes 2 seconds.
      context 'let' do
        let(:titles) do
          # An expensive process
          sleep(2)

          ['And Then There Were None', 'Far from the Madding Crowd', 'This Was a Man']
        end
        let(:authors) { ['Agatha Christie', 'Tom Hardy', 'Jeffrey Archer'] }

        subject { described_class.run }

        it 'has 3 book records' do
          expect(subject.length).to eq(3)
          expect(subject.pluck(:author)).to eq(authors)
          expect(subject.pluck(:title)).to eq(titles)
        end

        it { should be_a Array }
      end

      # On average, it takes 4 seconds.
      context 'let!' do
        let!(:titles) do
          # An expensive process
          sleep(2)

          ['And Then There Were None', 'Far from the Madding Crowd', 'This Was a Man']
        end
        let(:authors) { ['Agatha Christie', 'Tom Hardy', 'Jeffrey Archer'] }

        subject { described_class.run }

        it 'has 3 book records' do
          expect(subject.length).to eq(3)
          expect(subject.pluck(:author)).to eq(authors)
          expect(subject.pluck(:title)).to eq(titles)
        end

        it { should be_a Array }
      end
    end
  end
end
