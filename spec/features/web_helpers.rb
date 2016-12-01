def add_new_link(title, url, tag)
  visit '/links/new'
  fill_in 'title', :with => title
  fill_in 'url', :with => url
  fill_in 'tag', :with => tag
  click_button('Add')
end
