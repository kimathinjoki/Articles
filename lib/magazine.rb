

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
        @@ll
    end

end