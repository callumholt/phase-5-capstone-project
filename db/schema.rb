# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_07_14_212913) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dogs", force: :cascade do |t|
    t.integer "id_of_dog"
    t.string "primary_key"
    t.integer "id_of_owner"
    t.text "name_of_dog"
    t.integer "age_of_dog"
    t.text "breed_of_dog"
    t.text "bio_of_dog"
    t.integer "location_postCode"
    t.text "dates_require_dogSitting"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "owner_id"
  end

  create_table "dogs_users", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "dog_id", null: false
    t.index ["dog_id", "user_id"], name: "index_dogs_users_on_dog_id_and_user_id"
    t.index ["user_id", "dog_id"], name: "index_dogs_users_on_user_id_and_dog_id"
  end

  create_table "owners", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.text "name"
    t.text "bio"
    t.integer "postcode"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "username"
    t.string "password_digest"
  end

end
