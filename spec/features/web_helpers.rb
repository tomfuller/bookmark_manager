def add_link
  visit "/links/new"
  fill_in("url", with: "https://github.com/")
  fill_in("title", with: "Github")
end
