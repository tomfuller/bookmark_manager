require 'spec_helper'

RSpec.feature 'Link add new' do
  scenario 'we want to add the website address and title to our bookmark manager' do

    visit '/links/new'
    expect(page.status_code).to eq 200
    
    fill_in 'title', :with => 'Github Pong'
    fill_in 'url', :with => 'https://github.com/makersacademy/course/blob/master/pills/github_pong.md'
    click_button "Add"
    expect(page.current_path).to eq "/links"

    within 'ul#links' do
      expect(page).to have_content("Github Pong")
    end
  end

end
