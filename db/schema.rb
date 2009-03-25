# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090325164613) do

  create_table "import_files", :force => true do |t|
    t.string   "comment"
    t.boolean  "consumed"
    t.string   "lead_data_file_name"
    t.string   "lead_data_content_type"
    t.integer  "lead_data_file_size"
    t.datetime "lead_data_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "leads", :force => true do |t|
    t.string   "company_name"
    t.string   "contact"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "country"
    t.string   "phone"
    t.string   "email"
    t.string   "fax"
    t.text     "notes"
    t.text     "operations"
    t.text     "commodities"
    t.string   "url"
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "updated_by"
    t.integer  "import_file_id"
  end

end
