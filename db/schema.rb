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

ActiveRecord::Schema.define(version: 20140718181245) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "app_products", force: true do |t|
    t.integer  "product_id"
    t.integer  "app_id"
    t.string   "chargify_product_billing_id"
    t.string   "price"
    t.string   "billing_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "app_resources", force: true do |t|
    t.integer  "app_product_id"
    t.string   "dynos"
    t.string   "redis_plan"
    t.string   "device_licenses"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "apps", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.boolean  "private",         default: false
    t.boolean  "featured",        default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "app_type"
    t.string   "heroku_app_name"
    t.boolean  "deployed",        default: false
    t.string   "uuid"
    t.string   "status"
    t.string   "current_job"
    t.string   "new_name"
    t.integer  "project_id"
    t.boolean  "live_app",        default: false
    t.string   "slug"
    t.string   "git_url"
    t.string   "stack"
  end

  add_index "apps", ["project_id"], name: "index_apps_on_project_id", using: :btree
  add_index "apps", ["slug"], name: "index_apps_on_slug", using: :btree

  create_table "archives", force: true do |t|
    t.string   "username"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "archives", ["username"], name: "index_archives_on_username", using: :btree

  create_table "builds", force: true do |t|
    t.integer  "app_id"
    t.string   "version_tag"
    t.string   "rhodes_version"
    t.string   "target_device"
    t.string   "uuid"
    t.string   "status"
    t.string   "download_link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "builds", ["app_id"], name: "index_builds_on_app_id", using: :btree
  add_index "builds", ["user_id", "status"], name: "index_builds_on_user_id_and_status", using: :btree

  create_table "collaborators", force: true do |t|
    t.integer  "user_id"
    t.boolean  "role",       default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "project_id"
    t.integer  "app_id"
  end

  create_table "customs", force: true do |t|
    t.integer  "user_id"
    t.string   "device"
    t.string   "url"
    t.boolean  "active",      default: true
    t.string   "uuid"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "publish",     default: false
    t.string   "folder_uuid"
    t.string   "link_uuid"
    t.string   "job_name"
  end

  create_table "deploys", force: true do |t|
    t.integer  "app_id"
    t.integer  "user_id"
    t.text     "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "uuid"
  end

  add_index "deploys", ["app_id"], name: "index_deploys_on_app_id", using: :btree
  add_index "deploys", ["user_id", "status"], name: "index_deploys_on_user_id_and_status", using: :btree

  create_table "gallery_builds", force: true do |t|
    t.string   "status"
    t.string   "uuid"
    t.string   "folder_uuid"
    t.integer  "build_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "oauth_access_grants", force: true do |t|
    t.integer  "resource_owner_id",              null: false
    t.integer  "application_id",                 null: false
    t.string   "token",                          null: false
    t.integer  "expires_in",                     null: false
    t.string   "redirect_uri",      limit: 2048, null: false
    t.datetime "created_at",                     null: false
    t.datetime "revoked_at"
    t.string   "scopes"
  end

  add_index "oauth_access_grants", ["token"], name: "index_oauth_access_grants_on_token", unique: true, using: :btree

  create_table "oauth_access_tokens", force: true do |t|
    t.integer  "resource_owner_id"
    t.integer  "application_id",    null: false
    t.string   "token",             null: false
    t.string   "refresh_token"
    t.integer  "expires_in"
    t.datetime "revoked_at"
    t.datetime "created_at",        null: false
    t.string   "scopes"
  end

  add_index "oauth_access_tokens", ["refresh_token"], name: "index_oauth_access_tokens_on_refresh_token", unique: true, using: :btree
  add_index "oauth_access_tokens", ["resource_owner_id"], name: "index_oauth_access_tokens_on_resource_owner_id", using: :btree
  add_index "oauth_access_tokens", ["token"], name: "index_oauth_access_tokens_on_token", unique: true, using: :btree

  create_table "oauth_applications", force: true do |t|
    t.string   "name",                      null: false
    t.string   "uid",                       null: false
    t.string   "secret",                    null: false
    t.string   "redirect_uri", limit: 2048, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "oauth_applications", ["uid"], name: "index_oauth_applications_on_uid", unique: true, using: :btree

  create_table "products", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", force: true do |t|
    t.string   "name"
    t.integer  "rhodes_app_id"
    t.integer  "rhosync_app_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.integer  "user_id"
  end

  create_table "providers", force: true do |t|
    t.integer  "user_id"
    t.string   "provider_name"
    t.string   "api_username"
    t.string   "api_token"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "public_keys", force: true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "key"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "key_hash"
  end

  add_index "public_keys", ["key_hash"], name: "index_public_keys_on_key_hash", using: :btree

  create_table "repo_keys", force: true do |t|
    t.integer  "user_id"
    t.text     "private_key"
    t.text     "public_key"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stripe_subscription_states", force: true do |t|
    t.string   "status"
    t.integer  "trial_end"
    t.integer  "current_period_start"
    t.integer  "current_period_end"
    t.integer  "canceled_at"
    t.integer  "user_subscription_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "subscriptions", force: true do |t|
    t.string   "name"
    t.string   "product_handle"
    t.integer  "order"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "dynos"
    t.integer  "builds"
    t.integer  "free_devices"
    t.boolean  "allow_private"
    t.integer  "live_apps"
    t.integer  "live_devices"
    t.string   "redis_live_storage"
    t.integer  "free_apps"
    t.string   "redis_free_storage"
    t.integer  "price"
  end

  create_table "undeploys", force: true do |t|
    t.integer  "user_id"
    t.integer  "app_id"
    t.string   "status"
    t.string   "uuid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "undeploys", ["app_id"], name: "index_undeploys_on_app_id", using: :btree

  create_table "user_resources", force: true do |t|
    t.integer  "user_id"
    t.integer  "dynos",        default: 0
    t.integer  "license_keys", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "redis_plan",   default: "nano"
  end

  create_table "user_subscriptions", force: true do |t|
    t.integer  "user_id"
    t.integer  "subscription_id"
    t.integer  "chargify_subscription_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "license_public_key"
    t.string   "license_private_key"
    t.integer  "expires_at"
    t.string   "stripe_subscription_id"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "encrypted_password",        limit: 128
    t.string   "salt",                      limit: 128
    t.string   "confirmation_token",        limit: 128
    t.string   "remember_token",            limit: 128
    t.boolean  "email_confirmed",                       default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.integer  "builds_count",                          default: 0
    t.string   "plan"
    t.datetime "last_signed_in_at"
    t.string   "published"
    t.string   "download_uuid"
    t.string   "api_token"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "mobile_number"
    t.boolean  "consumer_is_complete",                  default: false
    t.string   "setup_consumer_token"
    t.datetime "setup_expiration_token"
    t.string   "rhogallery_user_url"
    t.string   "organization_name"
    t.string   "stripe_customer_id"
    t.string   "provider"
    t.string   "uid"
    t.string   "provider_token"
    t.integer  "trial_time_left"
    t.boolean  "clearance_legacy_password",             default: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["id", "confirmation_token"], name: "index_users_on_id_and_confirmation_token", using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
