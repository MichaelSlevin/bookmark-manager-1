feature 'Adding bookmarks' do
  scenario 'bookmarks are visible' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    visit '/bookmarks'
    fill_in('title', with: 'BBC')
    fill_in('url', with: 'http://www.bbc.co.uk')
    click_on('Submit')
    expect(page).to have_content 'BBC'
  end
end