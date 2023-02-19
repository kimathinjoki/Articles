

class magazine


    
    attr_accesor :id, :name, :category

    @all = []

    def initialize(id: nil, name:, category:)
        @id = id
        @name = name
        @category = category
        @@all << self

    end 

    def self.all
        sql = <<-SQL
        SELECT * FROM magazines
        SQL
        
        DB[:conn].execute(sql).map do |row|
            self.new(row)
        end

    end

    def contributors
        sql = <<-SQL
        SELECT * FROM authors
        INNER JOIN articles ON articles.author = authors.name
        WHERE articles.magazine = ?
        SQL
    end
    

end