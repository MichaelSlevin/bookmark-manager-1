require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns a list of bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      # Add the test data
      connection.exec("INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com', 'Makers');")
      connection.exec("INSERT INTO bookmarks VALUES(2, 'http://www.destroyallsoftware.com', 'Destroy all software');")
      connection.exec("INSERT INTO bookmarks VALUES(3, 'http://www.google.com', 'Google');")

      bookmarks = Bookmark.all

      expect(bookmarks).to include({ title: 'Makers', url: 'http://www.makersacademy.com'})
      expect(bookmarks).to include({ title: 'Destroy all software', url: 'http://www.destroyallsoftware.com'})
      expect(bookmarks).to include({ title: 'Google', url: 'http://www.google.com'})
    end
  end
  describe '#add' do
    it "adds a bookmark to the database" do
      title = "BBC"
      url = "http://www.bbc.co.uk"
      Bookmark.add(title, url)
      expect(Bookmark.all).to include({title: title, url: url })
    end
  end
end