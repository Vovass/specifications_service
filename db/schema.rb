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

ActiveRecord::Schema.define(version: 2021_12_19_212316) do

  create_table "action_text_rich_texts", charset: "utf8mb3", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.string "name", null: false
    t.text "body", size: :long
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", charset: "utf8mb3", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", charset: "utf8mb3", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", charset: "utf8mb3", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "comments", charset: "utf8mb3", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.text "body"
    t.integer "retailer_id"
    t.integer "parent_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "field_histories", charset: "utf8mb3", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.string "fields_title"
    t.string "variation_name"
    t.text "description"
    t.integer "version"
    t.string "vocabulary_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "field_id"
    t.bigint "user_id"
    t.bigint "retailer_id"
    t.index ["field_id"], name: "index_field_histories_on_field_id"
    t.index ["retailer_id"], name: "index_field_histories_on_retailer_id"
    t.index ["user_id"], name: "index_field_histories_on_user_id"
  end

  create_table "fields", charset: "utf8mb3", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "retailer_id"
    t.text "description"
    t.bigint "vocabulary_id"
    t.bigint "user_id"
    t.index ["retailer_id"], name: "index_fields_on_retailer_id"
    t.index ["user_id"], name: "index_fields_on_user_id"
    t.index ["vocabulary_id"], name: "index_fields_on_vocabulary_id"
  end

  create_table "fields_tickets", charset: "utf8mb3", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.integer "ticket_id"
    t.integer "field_id"
  end

  create_table "retailers", charset: "utf8mb3", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_retailers_on_user_id"
  end

  create_table "tickets", charset: "utf8mb3", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "link"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_tickets_on_user_id"
  end

  create_table "user_roles", charset: "utf8mb3", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.string "role"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", charset: "utf8mb3", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "role"
    t.bigint "user_role_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["user_role_id"], name: "index_users_on_user_role_id"
  end

  create_table "variations", charset: "utf8mb3", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "field_id"
    t.bigint "user_id"
    t.index ["field_id"], name: "index_variations_on_field_id"
    t.index ["user_id"], name: "index_variations_on_user_id"
  end

  create_table "vocabularies", charset: "utf8mb3", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.string "spec_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_vocabularies_on_user_id"
  end

  create_table "vocabulary_histories", charset: "utf8mb3", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "spec_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "vocabulary_id"
    t.integer "version"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_vocabulary_histories_on_user_id"
    t.index ["vocabulary_id"], name: "index_vocabulary_histories_on_vocabulary_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
end
