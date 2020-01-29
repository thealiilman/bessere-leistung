module Bibliothek
  class GetBooks
    def self.run
      new.run
    end

    def run
      [
        {
          title: 'And Then There Were None',
          author: 'Agatha Christie'
        },
        {
          title: 'Far from the Madding Crowd',
          author: 'Tom Hardy'
        },
        {
          title: 'This Was a Man',
          author: 'Jeffrey Archer'
        }
      ]
    end
  end
end
