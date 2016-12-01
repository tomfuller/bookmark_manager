require 'spec_helper'

RSpec.feature 'Link list' do
  scenario 'we want to see a list of links and be able to click on one' do
    add_new_link('Makers Academy', 'http://www.makersacademy.com/', 'education')
    within 'ul#links' do
      expect(page).to have_content('Makers Academy')
    end
  end
end
