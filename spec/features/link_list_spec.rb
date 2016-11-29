require 'spec_helper'

RSpec.feature 'Link list' do
  scenario 'we want to see a list of links and be able to click on one' do
    Link.create(url: 'http://www.makersacademy.com/', title: 'Makers Academy')

    visit '/links'
    expect(page.status_code).to eq 200

    within 'ul#links' do
      expect(page).to have_content('Makers Academy')
    end
  end

end
