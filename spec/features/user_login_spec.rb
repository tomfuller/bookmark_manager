require 'spec_helper'

RSpec.feature 'User login' do

  scenario 'user visits website and logs in' do
    expect(User.count).to eq 0
    visit '/users/new'
    fill_in 'username', :with => "user-mcuserface@email.com"
    fill_in 'password', :with => "password123"
    fill_in 'password_confirmation', :with => 'password123'
    click_button('Submit')
    expect(page).to have_current_path('/links')
    expect(page).to have_content("Welcome, user-mcuserface@email.com!")
    expect(User.count).to eq 1
  end

  scenario 'user puts wrong password in confirmation field' do
    visit '/users/new'
    fill_in 'username', :with => "user-mcuserface@email.com"
    fill_in 'password', :with => "password123"
    fill_in 'password_confirmation', :with => 'wrongpassword'
    click_button('Submit')
    expect(User.count).to eq 0
    expect(page).to have_current_path('/user')
    expect(page).to have_content('Password does not match the confirmation')
  end

  scenario 'user doesnt enter an email address' do
    visit '/users/new'
    fill_in 'password', :with => "password123"
    fill_in 'password_confirmation', :with => 'password123'
    click_button('Submit')
    expect(User.count).to eq 0
    expect(page).to have_current_path('/user')
    expect(page).to have_content('Username must not be blank')
  end

  scenario 'user account already exists' do
    visit '/users/new'
    fill_in 'username', :with => "user-mcuserface@email.com"
    fill_in 'password', :with => "password123"
    fill_in 'password_confirmation', :with => 'password123'
    click_button('Submit')
    visit '/users/new'
    fill_in 'username', :with => "user-mcuserface@email.com"
    fill_in 'password', :with => "password123"
    fill_in 'password_confirmation', :with => 'password123'
    click_button('Submit')
    expect(User.count).to eq 1
    expect(page).to have_content('Username is already taken')
  end
end
