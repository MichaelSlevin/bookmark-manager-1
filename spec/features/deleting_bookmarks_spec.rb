feature 'Deleting bookmarks' do
  scenario 'Removing unwanted bookmakrs' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec("INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com', 'Makers');")
    visit '/bookmarks'
    click_on('Delete Makers')
    expect(page).not_to have_content 'Makers'
  end
end