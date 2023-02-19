require_relative "../config/environment"

class Author

    attr_reader :name

   
    def initialize(name:, id: nil)
            @name = name
            @id = id
    end

    def articles
        sql = <<-SQL
        SELECT * FROM articles
        WHERE author = ?
        SQL

        DB[:conn].execute(sql,self.name)
    end

    def magazines
        sql = <<-SQL
        SELECT * FROM magazines
        INNER JOIN articles ON magazines.name = articles.magazine
        WHERE articles.author = ?
        SQL

        DB[:conn].execute(sql,self.name)
    end

    def add_article(magazine, title)
        Article.new(title, magazine)
    end

end