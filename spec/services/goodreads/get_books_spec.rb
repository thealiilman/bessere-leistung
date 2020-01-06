require 'rails_helper'

describe Goodreads::GetBooks, type: :service do
  describe '.run' do
    let(:titles) do
      ['And Then There Were None', 'Far from the Madding Crowd', 'This Was a Man']
    end
    let(:authors) { ['Agatha Christie', 'Tom Hardy', 'Jeffrey Archer'] }

    subject { described_class.run }

    it { expect(subject.length).to eq(3) }

    it { expect(subject.pluck(:author)).to eq(authors) }
    it { expect(subject.pluck(:title)).to eq(titles) }
  end
end
