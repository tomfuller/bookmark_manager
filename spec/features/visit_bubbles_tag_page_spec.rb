require 'spec_helper'

RSpec.feature 'See all links tagged with "bubbles"' do

  scenario "add 2 pages, only one tagged bubbles" do
    add_new_link('Bubbles Generator', 'https://www.youtube.com/watch?v=NlV7EY5f3Zk', 'bubbles')
    add_new_link('Funny cat videos', 'https://www.youtube.com/watch?v=tntOCGkgt98', 'cats')
    visit '/tags/bubbles'
    expect(page).to have_content('Bubbles Generator')
    expect(page).not_to have_content('Funny cat videos')
  end
end
