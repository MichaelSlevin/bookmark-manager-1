feature "updating bookmarks" do
  scenario "bookmarks updated" do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec("INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com', 'Makers');")
    visit '/bookmarks'
    click_on('Update Makers')
    fill_in(:title, with: 'BBC')
    fill_in(:url, with: 'http://www.bbc.co.uk')
    click_on('Submit')
    expect(page).to have_content('BBC')
  end
end