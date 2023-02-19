require_relative '../lib/author'
require_relative '../lib/magazine'

DB = { conn: SQLite3::Database.new("db/article.db")}