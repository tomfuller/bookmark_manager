
RSpec.feature "Seeing a list of websites" do
  scenario "showing a list" do
    Link.create(url: 'http://www.google.com', title: 'Google')
    visit '/links'
    expect(page).to have_content("Google")
  end
end
