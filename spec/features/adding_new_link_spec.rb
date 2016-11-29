require 'spec_helper'
require 'database_cleaner'

DatabaseCleaner.clean_with :truncation

RSpec.feature 'new links' do
  scenario 'we want to be able to add new links' do
    DatabaseCleaner.clean
    visit('/links/new')
    fill_in 'title', :with => "DataMapper"
    fill_in 'url', :with => 'http://datamapper.org/docs/associations.html'
    click_button 'Add link'
    expect(current_path).to eq '/links'

    within 'ul#links' do
      expect(page).to have_content('DataMapper')
    end
  end
end
