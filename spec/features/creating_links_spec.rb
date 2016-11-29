RSpec.feature "Adding new links" do
  scenario "creating links" do
    visit "/links/new"
    fill_in("url", with: "https://github.com/")
    fill_in("title", with: "Github")
    click_button("Save")
    expect(page).to have_content("Github")
  end
end
