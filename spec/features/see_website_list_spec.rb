RSpec.feature "Seeing a list of websites" do
  scenario "showing a list" do
    Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
    visit '/links'

    expect(page).to have_content("Makers Academy")
  end
end
