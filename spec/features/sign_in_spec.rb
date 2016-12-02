RSpec.feature 'Sign in' do
  scenario 'our user wants to sign in and see a welcome message' do
    visit '/users/new'
    fill_in 'username', :with => "user@user.com"
    fill_in 'password', :with => "password123"
    fill_in 'password_confirmation', :with => 'password123'
    click_button('Submit')
    visit('/sign-in')
    fill_in'username', :with => 'user@user.com'
    fill_in'password', :with => 'password123'
    click_button('Sign In')
    expect(page).to have_content('Welcome, user@user.com')
  end
end
