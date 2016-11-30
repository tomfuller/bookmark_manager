require 'spec_helper'

RSpec.feature 'Add tag' do

  scenario "to a link" do
    visit '/links/new'
    fill_in 'title', :with => 'Facebook'
    fill_in 'url', :with => 'http://www.facebook.com'
    fill_in 'tag', :with => 'social'
    click_button('Add')
    expect(page).to have_content('social')
  end

end
