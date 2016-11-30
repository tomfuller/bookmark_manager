RSpec.feature 'Filter links' do
  scenario 'we want to be able to see only the tags we select in our filter' do
    add_link
    fill_in "tag", :with => 'bubbles'
    visit '/tags/bubbles'
    expect(page).to have_content('Tag: bubbles')
  end
end
