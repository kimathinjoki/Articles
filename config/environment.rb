require_relative '../lib/author'
require_relative '../lib/magazine'
require_relative '../lib/article'

DB = { conn: SQLite3::Database.new("db/article.db")}