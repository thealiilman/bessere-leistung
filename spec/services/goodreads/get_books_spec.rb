require 'rails_helper'

describe Goodreads::GetBooks, type: :service do
  describe '.run' do
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

    it 'is an array' do
      expect(subject).to be_a(Array)
    end
  end
end
