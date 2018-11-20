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

  def self.hold(id)
    @@id = id
  end

  def self.id_to_update
    @@id
  end

  def self.record_details
    bookmarks = sql_query("Select * from bookmarks where title = '#{@@id}'")
    bookmarks.map { |bookmark| { id: bookmark['id'], title: bookmark['title'], url: bookmark['url'] } }.pop
    # |bookmark| { id: bookmark['id'], title: bookmark['title'], url: bookmark['url'] } }
  end

  def self.update(title, url)
    sql_query("UPDATE bookmarks SET url = '#{url}', title = '#{title}' where title = '#{@@id}'")
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
