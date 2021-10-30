class Employee < ApplicationRecord
    belongs_to :user

    def self.search(search)
        if search
            words = search.split(' ')
            Employee.where(
            @searchResults =Array.new(words.length, 'title LIKE ?').join(' AND '),
            *words.map { |word| "%#{word}%" }) 
        else
            @searchResults = "no search =["           
        end
      end
end
