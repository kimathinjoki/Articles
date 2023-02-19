require_relative "../config/environment"


class Article < environment

    attr_accessor :id
    attr_reader :title, :magazine, :author


    def initialize(id: nil, author = Author.new, magazine = Magazine.new , title:)

        @id = id
        @title = title
        @author = author
        @magazine = magazine
    end

    def author
        sql = <<-SQL
        SELECT * FROM authors
        WHERE author = ?
        SQL

        DB[:conn].execute(sql,self.author)
    end

end