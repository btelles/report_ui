# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 1) do

  create_table "articles", :force => true do |t|
    t.string "title"
    t.string "content"
  end

  create_table "people", :force => true do |t|
    t.string  "first_name"
    t.string  "last_name"
    t.date    "date_of_birth"
    t.decimal "amount",        :precision => 10, :scale => 2
  end

  create_table "reports", :force => true do |t|
    t.string "name"
    t.string "description"
    t.string "code"
    t.string "used_columns"
    t.string "includes"
    t.string "sorts"
    t.string "filters"
  end

  create_table "temp_reports", :force => true do |t|
    t.string "name"
    t.text   "query"
    t.string "language"
  end

end
