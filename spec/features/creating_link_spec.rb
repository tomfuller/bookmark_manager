require 'spec_helper'

RSpec.feature 'Link add new' do
  scenario 'we want to add the website address and title to our bookmark manager' do

    visit '/links/new'
    fill_in 'title', :with => 'BBC news'
    fill_in 'url', :with => 'http://www.bbc.co.uk/'
    click_button('Add')
    expect(page).to have_content('BBC news')
  end

end
