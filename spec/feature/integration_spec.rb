# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a book', type: :feature do
    scenario 'valid inputs' do
        visit new_book_path
        fill_in "book[title]", with: 'Harry Potter'
        fill_in "book[author]", with: 'J.K. Rowling'
        fill_in "book[price]", with: 6.98
        fill_in "book[published_date]", with: '1997-06-26'
        click_on 'Create Book'
        visit books_path
        expect(page).to have_content('Harry Potter')
    end
end
