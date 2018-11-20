require 'pg'

class Bookmark
  def self.all
    bookmarks = sql_query('SELECT * FROM bookmarks;')
    bookmarks.map { |bookmark| { title: bookmark['title'], url: bookmark['url'] } }
  end

  def self.add(title, url)
    sql_query("INSERT INTO bookmarks(url, title) VALUES('#{url}', '#{title}');")
  end

  def self.remove(title)
    sql_query("DELETE FROM bookmarks WHERE title = '#{title}';")
  end

  private

  def self.sql_query(query)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    return connection.exec(query)
  end

end
