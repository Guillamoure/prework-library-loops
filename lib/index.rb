require 'pry'

library = [
  {title: "Dracula", author: "Bram Stoker", genres: ["Horror", "Gothic"], pages: 418, publication_year: 1897, completed: true},
  {title: "Slaughterhouse Five; or the Children's Crusade", author: "Kurt Vonnegut, Jr.", genres: ["Satire", "Science Fiction"], pages: 186, publication_year: 1969, completed: false},
  {title: "Frankenstein; or, the Modern Prometheus", author: "Mary Shelley", genres: ["Gothic", "Horror", "Science Fiction"], pages: 280, publication_year: 1818, completed: true},
  {title: "Circe", author: "Madeline Miller", genres: ["Historical Fiction", "Fantasy"], pages: 385, publication_year: 2018, completed: false},
  {title: "Inferno", author: "Dante Alighieri", genres: ["Epic"], pages: 261, publication_year: 1320, completed: true},
  {title: "Mastering the Art of French Cooking", author: "Simone Beck, Louisette Bertholie, Julia Child", genres: ["Cooking"], pages: 726, publication_year: 1961, completed: false},
  {title: "Animal Farm", author: "George Orwell", genres: ["Political Satire"], pages: 112, publication_year: 1945, completed: true},
  {title: "War and Peace", author: "Leo Tolstoy", genres: ["Historical Fiction"], pages: 1225, publication_year: 1869, completed: false},
  {title: "The Innovators: How a Group of Hackers, Geniuses, and Geeks Created the Digital Revolution", author: "Walter Isaacson", genres: ["Biography"], pages: 488, publication_year: 2014, completed: false},
  {title: "Twilight", author: "Stephanie Meyer", genres: ["Young Adult", "Fantasy", "Romance"], pages: 498, publication_year: 2005, completed: true},
  {title: "The Life of Washington", author: "Mason Weems", genres: ["Historical Fiction", "Biography"], pages: 264, publication_year: 1809, completed: false},
  {title: "The Travels of John Mandeville", author: "John Mandeville", genres: ["Historical Fiction", "Fantasy"], pages: 167, publication_year: 1371, completed: false},
  {title: "Gulliver's Travels; or, Travels into Several Remote Nations of the World. In Four Parts. By Kenuel Gulliverr, First a Sugeon, and tthen a Captain of Several Ships", author: "Jonathan Swift", genres: ["Political Satire", "Fantasy"], pages: 240, publication_year: 1726, completed: true}
]

# WRITE CODE BELOW HERE

#returns the number of pages of all books in the library 
def all_pages(library)
  library.reduce(0){ |sum, book|
   sum + book[:pages]
  }
end 

#returns the numbe of pages read 
def all_pages_read(library)
  library.reduce(0){ |totalPagesRead, book|
   if book[:completed]
    totalPagesRead + book[:pages] 
   else 
    totalPagesRead 
   end 
  }
end 

#returns an array of all unique genres in the libray excluding 
def all_genres(library)
  genre_array = []
  library.each { |book| 
    book[:genres].each{ |genre|
      if !genre_array.include?(genre)
        genre_array << genre
      end 
    }
  }
  genre_array
end 


#returns an array of hashes of all the books read
def books_read(library) 
  booksRead = []
  library.each { |book|
    if book[:completed]
      booksRead << book
    end 
  }
  booksRead
end 

#Prints number of books and pages read
def completed_books_detail(library)
  numBooksRead = books_read(library).size 
  numPagesRead = all_pages_read(library)
  
  puts "I've read #{numBooksRead} books, totaling at #{numPagesRead} pages"
end 

#Returns an array of strings containing the title and author of each book
def books_in_library(library)
  titleArray = []
  library.each { |book|
    bookTitle = "#{book[:title]} by #{book[:author]}"
    titleArray.push(bookTitle)
  }
  titleArray
end 


#Returns an array of strings containing the title and author ordered by publication date
def books_by_year(library)
  ordered_books = library.sort_by{ |book|
      book[:publication_year]
  } 
  books_in_library(ordered_books)
end 

#Returns an arry of hashes of books that have subtitles 
def books_with_subtitles(library)
  subtitledBooks = []
  library.each { |book|
    if book[:title].include? ";"
        subtitledBooks << book
    end 
  }
  subtitledBooks
end 

#returns an array of book titles.  If book has subtitle, it only returns the first title 
def books_primary_title(library)
  bookTitles = []
  library.each { |book|
    index = book[:title].index(";")  
    if index
      title = book[:title][0...index]
      bookTitles << title
    else 
      bookTitles << book[:title]
    end 
  }
  bookTitles 
end 

#returns a hash of the longest book
def highest_page_count(library)
  library.reduce({pages: 0}) { |longestBook, book|
      if book[:pages] > longestBook[:pages]
        longestBook = book 
      end 
      longestBook
  }
end 




# WRITE CODE ABOVE HERE


#binding.pry

#puts "Books!"
