require 'rails_helper'

RSpec.feature 'Flash Notice', type: :feature do
    scenario 'user sees a flash notice after creating a book' do
        visit new_book_path
        fill_in "book[title]", with: 'Harry Potter'
        fill_in "book[author]", with: 'J.K. Rowling'
        fill_in "book[price]", with: 6.98
        fill_in "book[published_date]", with: '1997-06-26'
        click_on 'Create Book'
        expect(page).to have_content('Book Harry Potter was successfully created.')
    end

    scenario 'user sees a flash notice after creating a book with empty title' do
        visit new_book_path
        fill_in "book[title]", with: ''
        click_on 'Create Book'
        expect(page).to have_content("Title can't be blank")
    end

    scenario 'user sees a flash notice after updating a book' do
        book = Book.create(
            title: 'Harry Potter',
            author: 'J.K. Rowling',
            price: 6.98,
            published_date: '1997-06-26'
        )
        visit edit_book_path(book)
        fill_in "book[title]", with: 'Harry Potter and the Chamber of Secrets'
        click_on 'Update Book'
        expect(page).to have_content('Book Harry Potter and the Chamber of Secrets was successfully updated.')
    end

    scenario 'user sees a flash notice after deleting a book' do
        book = Book.create(
            title: 'Harry Potter',
            author: 'J.K. Rowling',
            price: 6.98,
            published_date: '1997-06-26'
        )
        visit delete_book_path(book)
        click_on 'Delete'
        expect(page).to have_content('Book Harry Potter was successfully destroyed.')
    end
end
