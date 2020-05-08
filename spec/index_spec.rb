# bundle exec rspec to check
require 'index'
require 'spec_helper'

describe "Library:" do
    let(:library)  do
      [
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
        {title: "Gulliver's Travels; or, Travels into Several Remote Nations of the World. In Four Parts. By Kenuel Gulliverr, First a Surgeon, and then a Captain of Several Ships", author: "Jonathan Swift", genres: ["Political Satire", "Fantasy"], pages: 240, publication_year: 1726, completed: true}
      ]
    end

  describe "#all_pages" do
    it "returns the sum of pages of all the books in your library" do
      expect(all_pages(library)).to eq(5250)
    end
  end

  describe "#all_pages_read" do
    it "returns the sum of pages of all the completed books in your library" do
      expect(all_pages_read(library)).to eq(1809)
    end
  end

  describe "#all_genres" do
    arr = [
      "Horror",
      "Gothic",
      "Satire",
      "Science Fiction",
      "Historical Fiction",
      "Fantasy",
      "Epic",
      "Cooking",
      "Political Satire",
      "Biography",
      "Young Adult",
      "Romance"
    ]
    it "returns an array containing all the genres in your library, with no duplicates" do
      expect(all_genres(library)).to eq(arr)
    end
  end

  describe "#books_read" do
    arr = [
      {:title=>"Dracula", :author=>"Bram Stoker", :genres=>["Horror", "Gothic"], :pages=>418, :publication_year=>1897, :completed=>true},
      {:title=>"Frankenstein; or, the Modern Prometheus", :author=>"Mary Shelley", :genres=>["Gothic", "Horror", "Science Fiction"], :pages=>280, :publication_year=>1818, :completed=>true},
      {:title=>"Inferno", :author=>"Dante Alighieri", :genres=>["Epic"], :pages=>261, :publication_year=>1320, :completed=>true},
      {:title=>"Animal Farm", :author=>"George Orwell", :genres=>["Political Satire"], :pages=>112, :publication_year=>1945, :completed=>true},
      {:title=>"Twilight", :author=>"Stephanie Meyer", :genres=>["Young Adult", "Fantasy", "Romance"], :pages=>498, :publication_year=>2005, :completed=>true},
      {:title=>"Gulliver's Travels; or, Travels into Several Remote Nations of the World. In Four Parts. By Kenuel Gulliverr, First a Surgeon, and then a Captain of Several Ships", :author=>"Jonathan Swift", :genres=>["Political Satire", "Fantasy"], :pages=>240, :publication_year=>1726, :completed=>true}
    ]
    it "outputs an array listing all the books you completed" do
      expect(books_read(library)).to eq(arr)
    end
  end

  describe "#completed_books_detail" do
    str = "I've read 6 books, totaling at 1809 pages."
    it "returns a string that lists how many books you've read, and how many pages you've read" do
      expect(completed_books_detail(library)).to eq(str)
    end
  end

  describe "#books_in_library" do
    arr = [
      "Dracula by Bram Stoker",
      "Slaughterhouse Five; or the Children's Crusade by Kurt Vonnegut, Jr.",
      "Frankenstein; or, the Modern Prometheus by Mary Shelley",
      "Circe by Madeline Miller",
      "Inferno by Dante Alighieri",
      "Mastering the Art of French Cooking by Simone Beck, Louisette Bertholie, Julia Child",
      "Animal Farm by George Orwell",
      "War and Peace by Leo Tolstoy",
      "The Innovators: How a Group of Hackers, Geniuses, and Geeks Created the Digital Revolution by Walter Isaacson",
      "Twilight by Stephanie Meyer",
      "The Life of Washington by Mason Weems",
      "The Travels of John Mandeville by John Mandeville",
      "Gulliver's Travels; or, Travels into Several Remote Nations of the World. In Four Parts. By Kenuel Gulliverr, First a Surgeon, and then a Captain of Several Ships by Jonathan Swift"
    ]
    it "returns an array of strings where each string is each book in your library, with their title and author" do
      expect(books_in_library(library)).to eq(arr)
    end
  end

  describe "#books_by_year" do
    arr = [
      "Inferno by Dante Alighieri",
      "The Travels of John Mandeville by John Mandeville",
      "Gulliver's Travels; or, Travels into Several Remote Nations of the World. In Four Parts. By Kenuel Gulliverr, First a Surgeon, and then a Captain of Several Ships by Jonathan Swift",
      "The Life of Washington by Mason Weems",
      "Frankenstein; or, the Modern Prometheus by Mary Shelley",
      "War and Peace by Leo Tolstoy",
      "Dracula by Bram Stoker",
      "Animal Farm by George Orwell",
      "Mastering the Art of French Cooking by Simone Beck, Louisette Bertholie, Julia Child",
      "Slaughterhouse Five; or the Children's Crusade by Kurt Vonnegut, Jr.",
      "Twilight by Stephanie Meyer",
      "The Innovators: How a Group of Hackers, Geniuses, and Geeks Created the Digital Revolution by Walter Isaacson",
      "Circe by Madeline Miller",
    ]
    it "returns an array of strings, however the books are sorted by what year they were published" do
      expect(books_by_year(library)).to eq(arr)
    end
  end

  describe "#books_with_subtitles" do
    arr = [
      {:title=>"Slaughterhouse Five; or the Children's Crusade", :author=>"Kurt Vonnegut, Jr.", :genres=>["Satire", "Science Fiction"], :pages=>186, :publication_year=>1969, :completed=>false},
      {:title=>"Frankenstein; or, the Modern Prometheus", :author=>"Mary Shelley", :genres=>["Gothic", "Horror", "Science Fiction"], :pages=>280, :publication_year=>1818, :completed=>true},
      {:title=> "Gulliver's Travels; or, Travels into Several Remote Nations of the World. In Four Parts. By Kenuel Gulliverr, First a Surgeon, and then a Captain of Several Ships", :author=>"Jonathan Swift", :genres=>["Political Satire", "Fantasy"], :pages=>240, :publication_year=>1726, :completed=>true}
    ]
    it "outputs an array of book hashes that have titles with a subtitle" do
      expect(books_with_subtitles(library)).to eq(arr)
    end
  end

  describe "#books_primary_title" do
    arr = [
      "Dracula", 
      "Slaughterhouse Five",
      "Frankenstein",
      "Circe",
      "Inferno",
      "Mastering the Art of French Cooking",
      "Animal Farm",
      "War and Peace",
      "The Innovators",
      "Twilight",
      "The Life of Washington",
      "The Travels of John Mandeville",
      "Gulliver's Travels"
    ]
    it "outputs an array of book title strings. if the book title has a subtitle, only output the primary title" do
      expect(books_primary_title(library)).to eq(arr)
    end
  end

  describe "#highest_page_count" do
    hash = {
      title: "War and Peace",
      author: "Leo Tolstoy",
      genres: ["Historical Fiction"],
      pages: 1225,
      publication_year: 1869,
      completed: false
    }
    it "outputs the hash of the longest book, with the highest page count" do
      expect(highest_page_count(library)).to eq(hash)
    end
  end

  describe "#recommended_books" do
    it "takes your library and a number as arguments, and outputs an array of strings. the number of strings in the array should be equal to the number argument. the strings are about books you are recommending from your entire library, organized by fewest page count to longest page count. e.g. if the number argument is 4, you should output the 4 shortest books." do
      expect(recommended_books(library)).to eq(arr)
    end
  end

  describe "#recommended_books_by_genre" do
    it "takes your library, and two strings as arguments, and outputs an array of strings. the first string argument should be a genre that is preferred, and the second should be a genre that is not preferred. the array should be a list of recommendations, listing preferred genres first, followed by other books in your library. the books with genres that are not preferred should not be in the array" do
      expect(recommended_books_by_genre(library)).to eq(arr)
    end
  end


end
