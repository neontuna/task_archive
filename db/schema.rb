# encoding: UTF-8
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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 0) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contacts", force: :cascade do |t|
    t.integer  "customer_id",                              null: false
    t.string   "phone",                        limit: 25,  null: false
    t.string   "phoneext",                     limit: 10,  null: false
    t.string   "fax",                          limit: 25,  null: false
    t.string   "alternatephone",               limit: 32,  null: false
    t.string   "alternatephone1",              limit: 32,  null: false
    t.string   "cellphone",                    limit: 25,  null: false
    t.string   "title",                        limit: 50,  null: false
    t.string   "extranotes",                   limit: 50,  null: false
    t.string   "roomnumber",                   limit: 50,  null: false
    t.string   "firstname",                    limit: 50,  null: false
    t.string   "middleinitial",                limit: 2,   null: false
    t.string   "lastname",                     limit: 50,  null: false
    t.string   "username",                     limit: 64,  null: false
    t.string   "emailaddress",                 limit: 255, null: false
    t.string   "address",                      limit: 128, null: false
    t.string   "address1",                     limit: 128, null: false
    t.string   "country",                      limit: 100, null: false
    t.string   "city",                         limit: 32,  null: false
    t.string   "state",                        limit: 40,  null: false
    t.string   "zip",                          limit: 16,  null: false
    t.datetime "lastactivity",                             null: false
    t.datetime "datestamp",                                null: false
    t.datetime "last_modified_date",                       null: false
    t.boolean  "is_primary_outsource_contact",             null: false
    t.string   "narrative_full_name",          limit: 250, null: false
    t.string   "sorting_full_name",            limit: 250, null: false
    t.integer  "name_salutation_id"
    t.integer  "name_suffix_id"
    t.integer  "country_id"
    t.string   "phone_basic",                  limit: 25,  null: false
    t.string   "alternate_phone_basic",        limit: 32,  null: false
    t.string   "alternate_phone1_basic",       limit: 32,  null: false
    t.string   "cell_phone_basic",             limit: 25,  null: false
    t.string   "email_address_2",              limit: 255, null: false
    t.string   "email_address_3",              limit: 255, null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string "country_code",              limit: 2,   null: false
    t.string "country_name_iso_standard", limit: 50,  null: false
    t.string "country_name_display",      limit: 100, null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string   "externalid",                   limit: 50,  null: false
    t.integer  "parentobjectid"
    t.integer  "creatorobjectid",                          null: false
    t.string   "custname",                     limit: 100, null: false
    t.string   "addr1",                        limit: 128, null: false
    t.string   "addr2",                        limit: 128, null: false
    t.string   "city",                         limit: 30,  null: false
    t.string   "region",                       limit: 40,  null: false
    t.string   "postalcode",                   limit: 10,  null: false
    t.string   "phone",                        limit: 25,  null: false
    t.string   "fax",                          limit: 25,  null: false
    t.string   "internet",                     limit: 255, null: false
    t.string   "alternatephone",               limit: 25,  null: false
    t.string   "alternatephone1",              limit: 25,  null: false
    t.datetime "lastactivity",                             null: false
    t.datetime "datestamp",                                null: false
    t.boolean  "use_parent_account_contracts",             null: false
    t.string   "phone_basic",                  limit: 25,  null: false
    t.integer  "country_id"
    t.string   "alternate_phone_basic",        limit: 25,  null: false
    t.string   "alternate_phone1_basic",       limit: 25,  null: false
    t.boolean  "is_active",                                null: false
    t.string   "account_name_basic",           limit: 100, null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.string   "tasktitle",          limit: 255,                          null: false
    t.string   "tnumber",            limit: 50,                           null: false
    t.string   "description",                                             null: false
    t.integer  "customer_id",                                             null: false
    t.integer  "entries"
    t.datetime "entrydate"
    t.decimal  "esttasktime",                    precision: 18, scale: 4
    t.decimal  "totalworkedhours",               precision: 18, scale: 4
    t.decimal  "totalbilledhours",               precision: 18, scale: 4
    t.decimal  "totalbilleddollars",             precision: 18, scale: 4
    t.integer  "taskcategoryid"
    t.integer  "priority",                                                null: false
    t.integer  "contact_id"
  end

  create_table "technicians", force: :cascade do |t|
    t.string   "username",            limit: 32,  null: false
    t.boolean  "active",                          null: false
    t.string   "email",               limit: 50,  null: false
    t.string   "officephone",         limit: 25,  null: false
    t.string   "officeext",           limit: 10,  null: false
    t.string   "homephone",           limit: 25,  null: false
    t.string   "mobilephone",         limit: 25,  null: false
    t.string   "title",               limit: 50,  null: false
    t.string   "firstname",           limit: 50,  null: false
    t.string   "lastname",            limit: 50,  null: false
    t.datetime "hiredate"
    t.string   "encrypted_password",  limit: 50,  null: false
    t.string   "narrative_full_name", limit: 250, null: false
    t.string   "sorting_full_name",   limit: 250, null: false
  end

  create_table "workentries", force: :cascade do |t|
    t.integer  "workrecord_id",                               null: false
    t.datetime "entrytimestamp",                              null: false
    t.datetime "dateworked",                                  null: false
    t.datetime "starttime"
    t.datetime "endtime"
    t.decimal  "hoursworked",        precision: 18, scale: 4
    t.decimal  "hoursbilled",        precision: 18, scale: 4
    t.decimal  "offsethours",        precision: 18, scale: 4, null: false
    t.datetime "billeddate"
    t.string   "internal_notes",                              null: false
    t.string   "summary_notes",                               null: false
    t.boolean  "force_non_billable",                          null: false
    t.boolean  "show_on_invoice",                             null: false
    t.integer  "contract_id"
  end

  create_table "workrecords", force: :cascade do |t|
    t.integer  "task_id",                  null: false
    t.integer  "technician_id",            null: false
    t.datetime "entrytimestamp",           null: false
    t.datetime "duringperiodstarting"
    t.datetime "duringperiodending"
    t.datetime "dateentered",              null: false
    t.integer  "created_by_user_id",       null: false
    t.datetime "last_modified_time",       null: false
    t.integer  "last_modified_by_user_id", null: false
  end

end
