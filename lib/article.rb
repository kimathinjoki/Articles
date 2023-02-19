require_relative "../config/environment"


class Article < environment

    attr_accessor :id
    attr_reader :title, :magazine, :author


    @@all=[]

    def initialize(id: nil, author = Author.new, magazine = Magazine.new , title:)

        @id = id
        @title = title
        @author = author
        @magazine = magazine
        @@all << self
    end

    def self.all
        @@all
    end

    def self.create_table

        sql= <<-SQL
        CREATE TABLE IF NOT EXISTS articles
        (id INTEGER PRIMARY KEY, title TEXT, magazine_id INTEGER, author_id INTEGER)
        SQL

        DB[:conn].execute(sql)
    end

    def author
        sql = <<-SQL
        SELECT author FROM articles
        WHERE title = ?
        SQL

        DB[:conn].execute(sql,self.title)
    end

    def magazine

        sql = <<-SQL
        SELECT magazine FROM articles
        WHERE title = ?
        SQL

        DB[:conn].execute(sql,self.title)

    end

end