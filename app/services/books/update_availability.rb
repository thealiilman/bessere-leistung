module Books
  class UpdateAvailability
    attr_reader :book

    def initialize(book)
      @book = book
    end

    def self.run(book)
      new(book).run
    end

    def run
      # An expensive process
      sleep(5)

      book.update(available: !book.available)
      OpenStruct.new(success?: true, book: book)
    end
  end
end
