RSpec.feature 'sign out' do
  scenario 'user wantes to sign out and get message' do
    visit '/users/new'
    fill_in 'username', :with => "user@user.com"
    fill_in 'password', :with => "password123"
    fill_in 'password_confirmation', :with => 'password123'
    click_button('Submit')
    visit('/sign-in')
    fill_in'username', :with => 'user@user.com'
    fill_in'password', :with => 'password123'
    click_button('Sign In')
    click_button "Sign Out"
    expect(page).to have_content "Goodbye!"
    expect(page).not_to have_content('Welcome, user@user.com')
  end
end
