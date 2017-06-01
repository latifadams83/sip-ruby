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

ActiveRecord::Schema.define(version: 20170527113255) do

  create_table "badges", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.integer  "programme_id"
    t.integer  "gradelevel_id"
    t.date     "start_date"
    t.date     "end_date"
    t.boolean  "status",        default: true, null: false
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["gradelevel_id"], name: "index_badges_on_gradelevel_id", using: :btree
    t.index ["programme_id"], name: "index_badges_on_programme_id", using: :btree
  end

  create_table "classrooms", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.integer  "capacity"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gradelevels", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.integer  "level"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["level"], name: "index_gradelevels_on_level", unique: true, using: :btree
  end

  create_table "klasses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.integer  "programme_id"
    t.integer  "gradelevel_id"
    t.date     "start_date"
    t.date     "end_date"
    t.boolean  "status",        default: true, null: false
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["gradelevel_id"], name: "index_klasses_on_gradelevel_id", using: :btree
    t.index ["programme_id"], name: "index_klasses_on_programme_id", using: :btree
  end

  create_table "periods", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.time     "start_time"
    t.time     "end_time"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "programmes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_programmes_on_name", unique: true, using: :btree
  end

  create_table "school_infos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.string   "alias"
    t.string   "code"
    t.string   "slogan"
    t.string   "location"
    t.string   "city"
    t.string   "region"
    t.string   "postal_code"
    t.string   "email"
    t.string   "phone"
    t.string   "logo"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "role",                   default: "", null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "badges", "gradelevels"
  add_foreign_key "badges", "programmes"
  add_foreign_key "klasses", "gradelevels"
  add_foreign_key "klasses", "programmes"
end
