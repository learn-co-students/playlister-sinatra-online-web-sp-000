# Add seed data here. Seed your database with `rake db:seed`
require_relative './../config/environment.rb'
require_relative "./../lib/library_parser.rb"

parser = LibraryParser.new
parser.call