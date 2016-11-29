require 'spec_helper'
require 'database_cleaner'

DatabaseCleaner.clean_with :truncation

RSpec.feature 'Link list' do
  scenario 'we want to see a list of links' do
    DatabaseCleaner.clean
    Link.create(url: 'http://www.makersacademy.com/', title: 'Makers Academy')

    visit '/links'
    expect(page.status_code).to eq 200

    within 'ul#links' do
      expect(page).to have_content('Makers Academy')
    end
  end

end
