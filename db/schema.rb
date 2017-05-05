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

ActiveRecord::Schema.define(version: 20_170_504_175_752) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'ads', force: :cascade do |t|
    t.bigint 'event_id'
    t.string 'title', null: false
    t.text 'description', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'user_id', null: false
    t.datetime 'termination_date'
    t.string 'file_file_name'
    t.string 'file_content_type'
    t.integer 'file_file_size'
    t.datetime 'file_updated_at'
    t.string 'slug'
    t.datetime 'start_date'
    t.index ['event_id'], name: 'index_ads_on_event_id'
    t.index ['slug'], name: 'index_ads_on_slug', unique: true
  end

  create_table 'events', force: :cascade do |t|
    t.string 'title', null: false
    t.text 'description', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'user_id', null: false
    t.datetime 'termination_date', null: false
    t.string 'file_file_name'
    t.string 'file_content_type'
    t.integer 'file_file_size'
    t.datetime 'file_updated_at'
    t.decimal 'latitude', precision: 9, scale: 7, null: false
    t.decimal 'longitude', precision: 10, scale: 7, null: false
    t.decimal 'radius', null: false
    t.string 'address', null: false
    t.string 'slug'
    t.datetime 'start_date'
    t.index ['slug'], name: 'index_events_on_slug', unique: true
  end

  create_table 'friendly_id_slugs', force: :cascade do |t|
    t.string 'slug', null: false
    t.integer 'sluggable_id', null: false
    t.string 'sluggable_type', limit: 50
    t.string 'scope'
    t.datetime 'created_at'
    t.index %w[slug sluggable_type scope], name: 'index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope', unique: true
    t.index %w[slug sluggable_type], name: 'index_friendly_id_slugs_on_slug_and_sluggable_type'
    t.index ['sluggable_id'], name: 'index_friendly_id_slugs_on_sluggable_id'
    t.index ['sluggable_type'], name: 'index_friendly_id_slugs_on_sluggable_type'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'name', null: false
    t.text 'about'
    t.string 'locale'
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.integer 'sign_in_count', default: 0, null: false
    t.datetime 'current_sign_in_at'
    t.datetime 'last_sign_in_at'
    t.inet 'current_sign_in_ip'
    t.inet 'last_sign_in_ip'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'avatar_file_name'
    t.string 'avatar_content_type'
    t.integer 'avatar_file_size'
    t.datetime 'avatar_updated_at'
    t.string 'provider'
    t.string 'uid'
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'ads', 'events'
end
