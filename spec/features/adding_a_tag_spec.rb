RSpec.feature "Adding a tag to a link" do
  scenario "Adding a tag" do
    add_link
    fill_in("tag", with: "Coding")
    click_button("Save")
    expect(page).to have_content("Coding")
  end
end
