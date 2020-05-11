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

def all_pages(library)
  # pages is the accumulator
  library.reduce(0) { |pages, book| pages + book[:pages] }
end

def all_pages_read(library)
  arr = Array.new
  library.each do |book|
    if book[:completed]
      arr << book
    end
  end
  arr.reduce(0) { |pages, book| pages + book[:pages]}
end

def all_genres(library)
  arr = Array.new
  library.each do |book|
    book[:genres].each do |genre|
      if !arr.include?(genre)
        arr << genre
      end
    end
  end
  arr
end

def books_read(library)
  arr = Array.new
  library.each do |book|
    if book[:completed]
      arr << book
    end
  end
  arr
end

def completed_books_detail(library)
  return "I've read #{books_read(library).count} books, totaling at #{all_pages_read(library)} pages."
end

def books_in_library(library)
  arr = Array.new
  library.each do |book|
    arr << "#{book[:title]} by #{book[:author]}"
  end
  arr
end

def books_by_year(library)
  sorted = library.sort_by do |book|
    book[:publication_year]
  end
  books_in_library(sorted)
end

def books_with_subtitles(library)
  arr = Array.new
  library.each do |book|
    if book[:title].include?(';')
      arr << book
    end
  end
  arr
end

def books_primary_title(library)
  arr = Array.new
  library.each do |book|
    if !book[:title].include?(';') && !book[:title].include?(':')
      arr << book[:title]
    elsif book[:title].include?(';')
      arr << book[:title].split(';').first
    elsif book[:title].include?(':')
      arr << book[:title].split(':').first
    end
  end
  arr
end

def highest_page_count(library)
  library.reduce do |page_count, book|
    page_count[:pages] > book[:pages] ? page_count : book
    # like inject { |memo, obj| block } → obj
  end
end

def recommended_books(library, num)
  arr = Array.new
  sorted = library.sort_by {|book| book[:pages]} # creates a new array, with animal farm up top
  count = 0
  while count < num
    arr << "You should read #{sorted[count][:title]} by #{sorted[count][:author]}; It's only #{sorted[count][:pages]} pages long."
    count += 1
  end
  arr
end

def recommended_books_by_genre(library, str1, str2)
  arr = Array.new
  library.each do |book|
    if book[:genres].include?(str1)
      arr << "Since you like #{str1}, you should read #{book[:title]} by #{book[:author]}!"
    elsif !book[:genres].include?(str2)
      arr << "I also recommend #{book[:title]} by #{book[:author]}"
    end
  end
  arr.sort { |a,b| b <=> a} # sorts it... backwards alphabetically
end
