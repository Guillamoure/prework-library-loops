##require 'spec_helper'
require_relative '../lib/index.rb'

RSpec.describe "Library:" do 

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
        ]

    end 


    describe "all_pages takes an argument of AOH which is an array of book hashes" do 
        it "returns the total number of pages in the library" do 
            books = [library[0], library[1], library[2]]
            expect(all_pages(books)).to eq(884)
        end
    end 

    describe "all_pages_read takes an argument of AOH which is an array of book hashes" do 
        it "returns the number of pages read" do 
            books = [library[0], library[1], library[2]]
            expect(all_pages_read(books)).to eq(698)
        end 
    end 


    describe "all_genres takes an argument of AOH " do 
        it "returns an array of genres which are unique" do 
            books = [library[0], library[1], library[2], library[7]]
            answer = ["Horror", "Gothic", "Satire", "Science Fiction", "Historical Fiction"]
            expect(all_genres(books)).to eq(answer)
        end 
    end 

    describe "books_read takes an argument of AOH of books" do 
        it "returns a number of books that have been completed" do 
            books = [library[0], library[1], library[2], library[7]]
            answer = [library[0], library[2]]
            expect(books_read(books)).to eq(answer)
        end 
    end

    describe "completed_books_detail takes an argument of AOH and prints a string with the number of books and number of pages read" do 
        specify {
                books = [library[0], library[1], library[2], library[7]]
                answer = "I've read 2 books, totaling at 698 pages\n"
                expect{completed_books_detail(books)}.to output(answer).to_stdout
        }
        
    end 

    describe "books_in_library takes an argument of AOH" do 
        it "returns an array containing strings of title and author of book" do 
            books = [library[0], library[1], library[2]]
            answer = [
                "Dracula by Bram Stoker",
                "Slaughterhouse Five; or the Children's Crusade by Kurt Vonnegut, Jr.",
                "Frankenstein; or, the Modern Prometheus by Mary Shelley"
            ]
            expect(books_in_library(books)).to eq(answer)
        end 
    end 

    describe "books_by_year take an argument of AOH" do 
        it "returns an array containing strings of title and author of book sorted by publication year" do 
            books = [library[0], library[1], library[2]]
            answer = [
                "Frankenstein; or, the Modern Prometheus by Mary Shelley",
                "Dracula by Bram Stoker",
                "Slaughterhouse Five; or the Children's Crusade by Kurt Vonnegut, Jr."
            ]
            expect(books_by_year(books)).to eq(answer)
        end 
    end 

    describe "books_with_subtitles takes an argument of AOH" do 
        it "returns an array of books that have subtitles" do 
            books = [library[0], library[1], library[2], library[7]]
            answer = [library[1], library[2]]
            expect(books_with_subtitles(books)).to eq(answer)
        end 
    end 

    describe "books_primary_title takes an arugment of AOH" do 
        it "returns an array of book title strings. If a book has a subtitle, only return the primary title" do
            books = [library[0], library[1], library[2], library[7]]
            answer = ["Dracula", "Slaughterhouse Five", "Frankenstein", "War and Peace"]
            expect(books_primary_title(books)).to eq(answer)
        end 
    end 


    describe "highest_page_count takes an argument of AOH" do 
        it "returns the hash of the longest book" do 
            books = books = [library[0], library[1], library[2], library[7]]
            answer = library[7]
            expect(highest_page_count(books)).to eq(answer)
        end 
    end 

    describe "recommended_books accepts two arguments: the first is an AOH and the second is a number" do 
        it "returns 'n' number of books that are the shortest, where 'n' = second argument" do 
            books = books = [library[0], library[1], library[2], library[7]]
            answer = [
                "You should read Slaughterhouse Five; or the Children's Crusade by Kurt Vonnegut, Jr.; it's only 186 pages long!",
                "You should read Frankenstein; or, the Modern Prometheus by Mary Shelley; it's only 280 pages long!",
                "You should read Dracula by Bram Stoker; it's only 418 pages long!"
            ]
            expect(recommended_books(books, 3)).to eq(answer)
        end 
    end 

    describe "recommended_books_by_genre accepts three argument; the first is an AOH (library), the second is liked genre, the third is hated genre" do 
        it "returns an array. The array should a list of recommendations, listing the preferred genres first, followed by the the other books in your library. The books with the genres that are not preferred should not be in the array" do 
            answer = [
                "Since you like Historical Fiction, you should read Circe by Madeline Miller!",
                "Since you like Historical Fiction, you should read War and Peace by Leo Tolstoy!",
                "I also recommend Dracula by Bram Stoker.",
                "I also recommed Inferno by Dante Alighieri.",
                "I also recommend Mastering the Art of French Cooking by Simone Beck, Louisette Bertholie, Julia Child.",
                "I also recommend Animal Farm by George Orwell."
              ]
            expect(recommended_books_by_genre(library,"Historical Fiction", "Science Fiction")).to eq(answer)
        end 
    end 


end 