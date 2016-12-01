require 'spec_helper'

RSpec.feature 'Add tag' do

  scenario "to a link" do
    add_new_link('Facebook', 'http://www.facebook.com', 'social')
    link = Link.first
    expect(link.tags.map(&:name)).to include('social')
  end

  scenario 'add multiple tags' do
    add_new_link("Twitter", "https://twitter.com/?lang=en", "social, microblogging, trolls")
    visit "/tags/social"
    expect(page).to have_content 'Twitter'
    visit "/tags/microblogging"
    expect(page).to have_content 'Twitter'
    visit "/tags/trolls"
    expect(page).to have_content 'Twitter'
  end
end
