require 'rails_helper'

describe Books::UpdateAvailability, type: :service do
  describe '.run' do
    # On average, it takes 14 seconds.
    context 'multiple examples' do
      let(:book) do
        # An expensive process
        sleep(2)

        create(
          :book,
          title: 'This Was A Man',
          available: true,
          author: create(:author, name: 'Jeffrey Archer')
        )
      end

      subject { described_class.run(book) }

      it { expect(subject.success?).to be true }
      it { expect(subject.book.available).to be false }
    end

    # On average, it takes 7 seconds.
    context 'a single example' do
      let(:book) do
        # An expensive process
        sleep(2)

        create(
          :book,
          title: 'This Was A Man',
          available: true,
          author: create(:author, name: 'Jeffrey Archer')
        )
      end

      subject { described_class.run(book) }

      it do
        expect(subject.success?).to be true
        expect(subject.book.available).to be false
      end
    end
  end
end