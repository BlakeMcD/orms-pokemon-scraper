class Pokemon

    attr_accessor :id, :name, :type, :db

    def initialize(id:, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(name, type, db)
        sql = <<-SQL
            INSERT INTO pokemon(name, type) VALUES (?, ?)
        SQL

        db.execute(sql, name, type)
    end

    def self.find(id, db)
        sql = <<-SQL
            SELECT * FROM pokemon WHERE id = ?
        SQL

        pokemon_info = db.execute(sql, id).flatten

        Pokemon.new(id: pokemon_info[0], name: pokemon_info[1], type: pokemon_info[2], db: pokemon_info[3])


    end

end
