require 'spec_helper'

RSpec.feature 'Link add new' do
  scenario 'we want to add the website address and title to our bookmark manager' do
    add_new_link('BBC news', 'http://www.bbc.co.uk/', 'news')
    expect(page).to have_content('BBC news')
  end

end
