require 'rails_helper'

RSpec.describe Book, type: :model do
    subject do
        described_class.new(
            title: 'Harry Potter',
            author: 'J.K. Rowling',
            price: 6.98,
            published_date: '1997-06-26'
        )
    end

    it 'is valid with valid attributes' do
        expect(subject).to be_valid
    end

    it 'is not valid without a title' do
        subject.title = nil
        expect(subject).to_not be_valid
    end

    it 'is not valid without an author' do
        subject.author = nil
        expect(subject).to_not be_valid
    end

    it 'is not valid without a price' do
        subject.price = nil
        expect(subject).to_not be_valid
    end

    it 'is not valid without a published_date' do
        subject.published_date = nil
        expect(subject).to_not be_valid
    end
end
