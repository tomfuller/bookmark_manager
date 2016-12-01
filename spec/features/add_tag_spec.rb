require 'spec_helper'

RSpec.feature 'Add tag' do

  scenario "to a link" do
    add_new_link('Facebook', 'http://www.facebook.com', 'social')
    link = Link.first
    expect(link.tags.map(&:name)).to include('social')
  end

end
