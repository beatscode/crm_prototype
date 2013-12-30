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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130313183132) do

  create_table "accessor", :force => true do |t|
    t.integer "template_file_id", :null => false
    t.integer "tmpl_key_id",      :null => false
  end

  create_table "address", :force => true do |t|
    t.integer  "site_id",         :null => false
    t.integer  "contact_type_id", :null => false
    t.string   "addressline1"
    t.string   "addressline2"
    t.string   "addressline3"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.string   "country"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "address_phone", :id => false, :force => true do |t|
    t.integer "id",         :null => false
    t.integer "address_id", :null => false
    t.integer "phone_id",   :null => false
  end

  create_table "attributes", :force => true do |t|
    t.string   "name"
    t.string   "type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "authorize_transaction_log", :force => true do |t|
    t.integer  "site_id",                                                     :null => false
    t.integer  "invoice_id"
    t.string   "status",         :limit => 200
    t.string   "message",        :limit => 200
    t.text     "raw",                                                         :null => false
    t.string   "transaction_id", :limit => 20,                                :null => false
    t.decimal  "amount",                        :precision => 5, :scale => 2, :null => false
    t.datetime "created_at",                                                  :null => false
    t.datetime "updated_at"
  end

  add_index "authorize_transaction_log", ["site_id"], :name => "authorize_transaction_log_site_id_foreign"

  create_table "cart_status", :force => true do |t|
    t.integer  "site_id",     :null => false
    t.text     "serial_cart"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "cart_status", ["site_id"], :name => "cart_status_site_id_foreign"

  create_table "category", :force => true do |t|
    t.string   "name"
    t.string   "title"
    t.string   "description"
    t.string   "imageUrl"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "cc_information", :force => true do |t|
    t.integer  "site_id",                    :null => false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "addressline1", :limit => 60
    t.string   "city",         :limit => 60
    t.string   "state",        :limit => 60
    t.integer  "zipcode"
    t.string   "cc_number"
    t.string   "cc_type"
    t.string   "cc_exp_month"
    t.string   "cc_exp_year"
    t.string   "cc_csc"
    t.string   "active"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at"
  end

  add_index "cc_information", ["site_id"], :name => "cc_information_pages_id_foreign"

  create_table "code_plugins", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.string   "type"
    t.text     "code"
    t.integer  "priority",                    :null => false
    t.string   "active"
    t.string   "admin_editor"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.integer  "for_header",   :default => 0
    t.integer  "for_mobile",   :default => 0
  end

  create_table "companies", :force => true do |t|
    t.string   "guid",         :limit => 65
    t.string   "name",         :limit => 150
    t.string   "date_founded", :limit => 15
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  create_table "contact_type", :force => true do |t|
    t.string "type"
  end

  create_table "core_pages", :force => true do |t|
    t.string  "name"
    t.integer "page_type_id", :null => false
  end

  create_table "coupon_products", :force => true do |t|
    t.integer "coupon_id",  :null => false
    t.integer "product_id", :null => false
  end

  create_table "coupons", :force => true do |t|
    t.integer  "reseller_id"
    t.string   "name"
    t.string   "code"
    t.float    "discount",      :null => false
    t.integer  "discount_type"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "status"
    t.text     "description"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at"
  end

  create_table "custom_site_data", :force => true do |t|
    t.integer "site_id",               :null => false
    t.string  "name",    :limit => 65
    t.string  "type",    :limit => 40, :null => false
  end

  add_index "custom_site_data", ["site_id"], :name => "custom_site_data_site_id_foreign"

  create_table "deverrors", :force => true do |t|
    t.string   "type",       :limit => 250
    t.string   "title",      :limit => 200
    t.text     "file"
    t.text     "message"
    t.integer  "line"
    t.text     "trace"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "domain_view", :id => false, :force => true do |t|
    t.integer  "id",                                       :default => 0, :null => false
    t.integer  "company_id",                                              :null => false
    t.string   "domain_name"
    t.string   "mednet_own"
    t.string   "domain_type"
    t.integer  "site_id",                                                 :null => false
    t.datetime "created_at",                                              :null => false
    t.datetime "updated_at",                                              :null => false
    t.string   "expired",                    :limit => 1
    t.string   "expiration_date",            :limit => 23
    t.string   "domain_webspace_enabled",    :limit => 1
    t.string   "subdomain_webspace_enabled", :limit => 1
    t.string   "site_pointed",               :limit => 1
    t.string   "site_ftped",                 :limit => 1
  end

  create_table "domains", :force => true do |t|
    t.integer  "company_id",                               :null => false
    t.string   "domain_name"
    t.string   "mednet_own"
    t.string   "domain_type"
    t.integer  "site_id",                                  :null => false
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
    t.string   "expired",                    :limit => 1
    t.string   "expiration_date",            :limit => 23
    t.string   "domain_webspace_enabled",    :limit => 1
    t.string   "subdomain_webspace_enabled", :limit => 1
    t.string   "site_pointed",               :limit => 1
    t.string   "site_ftped",                 :limit => 1
  end

  create_table "email", :force => true do |t|
    t.integer "user_id",       :null => false
    t.string  "email_address"
  end

  create_table "emr_companies", :force => true do |t|
    t.string "name"
  end

  create_table "finance_options", :force => true do |t|
    t.string "name"
  end

  create_table "finance_view", :id => false, :force => true do |t|
    t.integer "site_id",              :default => 0,  :null => false
    t.string  "name"
    t.integer "id",                   :default => 0,  :null => false
    t.string  "N/A",     :limit => 3, :default => "", :null => false
  end

  create_table "finances", :force => true do |t|
    t.string "name"
  end

  create_table "help_topics", :force => true do |t|
    t.string  "title",     :limit => 65, :null => false
    t.integer "parent_id"
    t.string  "order",     :limit => 3,  :null => false
    t.text    "content",                 :null => false
  end

  create_table "insurance_view", :id => false, :force => true do |t|
    t.integer "site_id",         :default => 0, :null => false
    t.string  "name"
    t.integer "id",              :default => 0, :null => false
    t.string  "insurance_state"
  end

  create_table "insurances", :force => true do |t|
    t.string "name"
  end

  create_table "invoice_details", :force => true do |t|
    t.integer  "invoice_id",                                                  :null => false
    t.integer  "product_id",                                                  :null => false
    t.decimal  "discount",    :precision => 10, :scale => 2, :default => 0.0
    t.decimal  "cost",        :precision => 10, :scale => 2, :default => 0.0
    t.text     "description"
    t.integer  "quantity",                                                    :null => false
    t.integer  "coupon_id"
    t.datetime "created_at",                                                  :null => false
    t.datetime "updated_at"
  end


  create_table "invoices", :force => true do |t|
    t.integer  "user_id",                                                                            :null => false
    t.integer  "site_id",                                                                            :null => false
    t.integer  "product_id",                                                                         :null => false
    t.integer  "invoice_status",                                                                     :null => false
    t.text     "invoice_note"
    t.decimal  "total",                              :precision => 10, :scale => 2, :default => 0.0
    t.datetime "paid_date"
    t.date     "due_date"
    t.datetime "created_at",                                                                         :null => false
    t.datetime "updated_at"
    t.binary   "discount_applied",      :limit => 1
    t.integer  "discount_coupon_id"
    t.decimal  "discount_amount",                    :precision => 10, :scale => 2
    t.decimal  "price_before_discount",              :precision => 10, :scale => 2
  end

  create_table "laravel_cache", :id => false, :force => true do |t|
    t.string  "key",        :limit => 200
    t.text    "value"
    t.integer "expiration",                :null => false
  end

  create_table "laravel_migrations", :id => false, :force => true do |t|
    t.string  "bundle", :limit => 50,  :null => false
    t.string  "name",   :limit => 200, :null => false
    t.integer "batch",                 :null => false
  end

  create_table "module_options", :force => true do |t|
    t.integer "module_id",        :null => false
    t.string  "name"
    t.string  "method"
    t.boolean "display_override"
  end

  create_table "modules", :force => true do |t|
    t.string "title"
    t.string "nav_type"
    t.string "name"
    t.string "hidden"
  end

  create_table "navigation", :force => true do |t|
    t.integer  "site_id",       :null => false
    t.integer  "page_id",       :null => false
    t.string   "name"
    t.string   "title"
    t.string   "href"
    t.string   "is_parent"
    t.integer  "order",         :null => false
    t.integer  "parent_nav_id", :null => false
    t.integer  "ptype_id",      :null => false
    t.text     "comments"
    t.string   "creator"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "page_content", :force => true do |t|
    t.integer  "page_id",    :null => false
    t.text     "content"
    t.string   "creator"
    t.string   "live"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.text     "tmpl_keys"
  end

  create_table "page_content_tmpl", :force => true do |t|
    t.string   "name"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "page_count_history", :force => true do |t|
    t.integer   "site_id",    :null => false
    t.integer   "page_count", :null => false
    t.timestamp "timestamp",  :null => false
    t.datetime  "created_at", :null => false
    t.datetime  "updated_at"
  end

  create_table "page_templates", :force => true do |t|
    t.integer  "page_id",          :null => false
    t.integer  "template_file_id", :null => false
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "page_type", :force => true do |t|
    t.string   "type"
    t.text     "description"
    t.integer  "page_order",  :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "pages", :force => true do |t|
    t.integer   "user_id",                    :null => false
    t.integer   "site_id",                    :null => false
    t.string    "name",         :limit => 50
    t.string    "filename"
    t.integer   "page_type_id",               :null => false
    t.integer   "is_core"
    t.integer   "entity_id",                  :null => false
    t.integer   "invoice_id"
    t.timestamp "created_at",                 :null => false
    t.datetime  "updated_at"
  end

  create_table "payment_view", :id => false, :force => true do |t|
    t.integer "site_id",              :default => 0,  :null => false
    t.string  "name"
    t.integer "id",                   :default => 0,  :null => false
    t.string  "N/A",     :limit => 3, :default => "", :null => false
  end

  create_table "phones", :force => true do |t|
    t.integer "site_id",                       :null => false
    t.integer "contact_type_id",               :null => false
    t.string  "name",            :limit => 65
    t.string  "office_phone"
    t.string  "mobile_phone"
    t.string  "fax"
    t.string  "extension"
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.string   "code"
    t.string   "product_type"
    t.text     "description"
    t.decimal  "price",                          :precision => 10, :scale => 2, :default => 0.0
    t.decimal  "tax",                            :precision => 10, :scale => 2, :default => 0.0
    t.string   "isActive"
    t.binary   "adminActive",      :limit => 1
    t.float    "recurring",                                                                      :null => false
    t.string   "recurring_type",   :limit => 15
    t.integer  "recurring_cycle"
    t.decimal  "recurring_amount",               :precision => 10, :scale => 2
    t.datetime "created_at",                                                                     :null => false
    t.datetime "updated_at",                                                                     :null => false
  end

  create_table "publish_log", :force => true do |t|
    t.integer   "site_id",          :null => false
    t.integer   "template_id",      :null => false
    t.integer   "domain_id",        :null => false
    t.integer   "subdomain_update", :null => false
    t.timestamp "ftp_time",         :null => false
    t.integer   "layout"
    t.integer   "user_id"
  end

  add_index "publish_log", ["site_id"], :name => "publish_log_site_id_foreign"

  create_table "regions", :force => true do |t|
    t.string "iso"
    t.string "iso3"
    t.string "fips"
    t.string "country"
    t.string "continent"
    t.string "currency_code"
    t.string "currency_name"
    t.string "phone_prefix"
    t.string "postal_code"
    t.string "languages"
    t.string "geonameid"
  end

  create_table "reseller", :force => true do |t|
    t.string   "name"
    t.string   "appDomain",      :limit => 100
    t.binary   "installed",      :limit => 1
    t.string   "marketing_type", :limit => 100
    t.string   "bundleurl",      :limit => 100
    t.string   "bundlename",     :limit => 100
    t.text     "wl_folder"
    t.text     "product_name"
    t.text     "logo_url"
    t.string   "website",        :limit => 100
    t.string   "address",        :limit => 100
    t.string   "1800number",     :limit => 20
    t.string   "entity_type"
    t.string   "logo"
    t.string   "theme"
    t.string   "checkout_type",  :limit => 30
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
    t.string   "bundle_type",    :limit => 200
  end

  create_table "reseller_billing", :force => true do |t|
    t.integer  "reseller_id",    :null => false
    t.string   "billing_option"
    t.string   "api_key"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "reseller_billing", ["reseller_id"], :name => "reseller_billing_reseller_id_foreign"

  create_table "reseller_users", :force => true do |t|
    t.integer "reseller_id", :null => false
    t.integer "user_id",     :null => false
  end

  add_index "reseller_users", ["reseller_id"], :name => "reseller_users_reseller_id_foreign"

  create_table "roles", :force => true do |t|
    t.string "role_name"
    t.string "json_options_id"
  end

  create_table "service_view", :id => false, :force => true do |t|
    t.integer "id",      :default => 0, :null => false
    t.integer "site_id",                :null => false
    t.string  "name"
  end

  create_table "sessions", :force => true do |t|
    t.integer "last_activity", :null => false
    t.text    "data",          :null => false
  end

  create_table "site_bannerimages", :force => true do |t|
    t.integer  "site_id",        :null => false
    t.integer  "bannerimage_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "site_bannerimages", ["site_id"], :name => "site_bannerimages_site_id_foreign"

  create_table "site_contacts", :force => true do |t|
    t.integer  "site_id",       :null => false
    t.string   "fullname"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "suffix"
    t.string   "practice_name"
    t.string   "specialty"
    t.string   "has_purchased"
    t.string   "owner"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "site_contacts", ["site_id"], :name => "site_contacts_site_id_foreign"

  create_table "site_finance_options", :force => true do |t|
    t.integer "site_id",            :null => false
    t.integer "finance_options_id", :null => false
  end

  add_index "site_finance_options", ["site_id"], :name => "site_finance_options_site_id_foreign"

  create_table "site_finances", :force => true do |t|
    t.integer "site_id",    :null => false
    t.integer "finance_id", :null => false
  end

  add_index "site_finances", ["site_id"], :name => "site_finances_site_id_foreign"

  create_table "site_header_content", :force => true do |t|
    t.integer  "site_id",    :null => false
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "site_header_content", ["site_id"], :name => "site_header_content_site_id_foreign"

  create_table "site_insurances", :force => true do |t|
    t.integer "site_id",      :null => false
    t.integer "insurance_id", :null => false
  end

  add_index "site_insurances", ["site_id"], :name => "site_insurances_site_id_foreign"

  create_table "site_media", :force => true do |t|
    t.integer  "site_id",                                      :null => false
    t.string   "name",           :limit => 100
    t.string   "filename"
    t.string   "display_name",   :limit => 80
    t.integer  "uploaded_to_s3",                :default => 0
    t.string   "filetype",       :limit => 40
    t.string   "path"
    t.integer  "logo",                                         :null => false
    t.integer  "virus_scan",                    :default => 0
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
  end

  add_index "site_media", ["site_id"], :name => "site_media_site_id_foreign"

  create_table "site_page_seo", :force => true do |t|
    t.integer  "page_id",                   :null => false
    t.string   "title",       :limit => 80, :null => false
    t.text     "description",               :null => false
    t.text     "keywords"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at"
  end

  add_index "site_page_seo", ["page_id"], :name => "site_page_seo_page_id_foreign"

  create_table "site_plugins", :force => true do |t|
    t.integer "site_id",   :null => false
    t.integer "plugin_id", :null => false
    t.text    "parameter"
  end

  add_index "site_plugins", ["site_id"], :name => "site_plugins_site_id_foreign"

  create_table "site_policies", :force => true do |t|
    t.integer  "site_id",             :null => false
    t.text     "office_policy"
    t.text     "office_cancellation"
    t.text     "office_billing"
    t.text     "office_emergency"
    t.text     "mission_statement"
    t.text     "about_statement"
    t.string   "date_founded"
    t.string   "walk_in"
    t.string   "cancellation"
    t.string   "on_call"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  add_index "site_policies", ["site_id"], :name => "site_policies_site_id_foreign"

  create_table "site_practice_physicians", :force => true do |t|
    t.integer  "site_id",                          :null => false
    t.integer  "specialty_id",                     :null => false
    t.integer  "sub_specialty_id"
    t.integer  "cv_media_id"
    t.integer  "photo_media_id"
    t.string   "prefix",             :limit => 20
    t.string   "firstname",          :limit => 65
    t.string   "initial",            :limit => 1
    t.string   "lastname",           :limit => 65
    t.string   "suffix",             :limit => 5
    t.string   "title",              :limit => 65
    t.string   "gender",             :limit => 2
    t.string   "discipline"
    t.string   "photo"
    t.text     "medschool"
    t.text     "board_certificates"
    t.text     "undergrad"
    t.text     "membership"
    t.text     "organizations"
    t.text     "achievements"
    t.text     "residency"
    t.text     "biography"
    t.text     "cv"
    t.text     "languages"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  add_index "site_practice_physicians", ["site_id"], :name => "site_practice_physicians_site_id_foreign"

  create_table "site_practices", :force => true do |t|
    t.integer  "site_id",                                                  :null => false
    t.string   "practice_name",            :limit => 100
    t.string   "discipline",               :limit => 100
    t.string   "monday",                   :limit => 13
    t.string   "tuesday",                  :limit => 13
    t.string   "wednesday",                :limit => 13
    t.string   "thursday",                 :limit => 13
    t.string   "friday",                   :limit => 13
    t.string   "saturday",                 :limit => 13
    t.string   "sunday",                   :limit => 13
    t.string   "addressline1",             :limit => 60
    t.string   "addressline2",             :limit => 60
    t.string   "addressline3",             :limit => 60
    t.string   "city",                     :limit => 60
    t.string   "state",                    :limit => 45
    t.string   "zipcode",                  :limit => 9
    t.string   "country",                  :limit => 65
    t.string   "office_phone",             :limit => 13
    t.string   "fax",                      :limit => 13
    t.string   "contact_name",             :limit => 65
    t.string   "contact_phone",            :limit => 13
    t.string   "contact_extension",        :limit => 5
    t.string   "practice_admin_extension", :limit => 5
    t.string   "practice_admin_phone",     :limit => 13
    t.string   "practice_admin_name",      :limit => 65
    t.string   "office_manager_extension", :limit => 5
    t.string   "office_manager_phone",     :limit => 13
    t.string   "office_manager_name",      :limit => 65
    t.datetime "created_at",                                               :null => false
    t.datetime "updated_at",                                               :null => false
    t.binary   "main_location",            :limit => 1, :null => false
  end

  add_index "site_practices", ["site_id"], :name => "site_practices_site_id_foreign"

  create_table "site_products", :force => true do |t|
    t.integer  "site_id",                             :null => false
    t.integer  "product_id",                          :null => false
    t.boolean  "status",           :default => false, :null => false
    t.datetime "last_billed_date"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

  create_table "site_purchases_view", :id => false, :force => true do |t|
    t.integer  "site_id",                                                    :null => false
    t.integer  "user_id",                                                    :null => false
    t.integer  "product_id",                                                 :null => false
    t.decimal  "total",      :precision => 10, :scale => 2, :default => 0.0
    t.datetime "created_at",                                                 :null => false
    t.datetime "updated_at"
  end

  create_table "site_seo", :force => true do |t|
    t.integer  "site_id",                  :null => false
    t.string   "google",     :limit => 20
    t.string   "indexing",   :limit => 20
    t.datetime "created_at",               :null => false
    t.datetime "updated_at"
  end

  add_index "site_seo", ["site_id"], :name => "site_seo_site_id_foreign"

  create_table "site_slogans", :force => true do |t|
    t.integer "site_id",               :null => false
    t.string  "slogan",  :limit => 65
  end

  add_index "site_slogans", ["site_id"], :name => "site_slogans_site_id_foreign"

  create_table "site_staff", :force => true do |t|
    t.integer  "site_id",                                     :null => false
    t.string   "prefix",         :limit => 20
    t.string   "firstname",      :limit => 65
    t.string   "initial",        :limit => 1
    t.string   "lastname",       :limit => 65
    t.string   "suffix",         :limit => 5
    t.string   "position",       :limit => 65
    t.integer  "experience",                   :default => 0, :null => false
    t.string   "gender"
    t.string   "photo"
    t.text     "biography"
    t.string   "title"
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
    t.integer  "photo_media_id"
    t.integer  "cv_media_id"
  end

  add_index "site_staff", ["site_id"], :name => "site_staff_site_id_foreign"

  create_table "site_status_history", :force => true do |t|
    t.integer  "site_id",    :null => false
    t.string   "status"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "site_status_history", ["site_id"], :name => "site_status_history_site_id_foreign"

  create_table "site_support_request", :force => true do |t|
    t.integer  "site_id",    :null => false
    t.string   "subject"
    t.text     "message"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "site_template_options", :force => true do |t|
    t.integer   "site_id",                                   :null => false
    t.integer   "media_id",                                  :null => false
    t.decimal   "show_header", :precision => 1, :scale => 0, :null => false
    t.timestamp "timestamp",                                 :null => false
  end

  add_index "site_template_options", ["site_id"], :name => "site_template_options_site_id_foreign"

  create_table "site_type", :force => true do |t|
    t.string "type", :null => false
  end

  create_table "sites", :force => true do |t|
    t.integer  "company_id",                                          :null => false
    t.integer  "template_id"
    t.integer  "emr_company_id"
    t.string   "emr_link",       :limit => 100
    t.string   "custom_emr",     :limit => 65
    t.string   "practice_name"
    t.integer  "specialty_id"
    t.integer  "site_type_id"
    t.string   "specialty"
    t.string   "discipline"
    t.text     "slogan"
    t.string   "step"
    t.text     "custom_data"
    t.integer  "has_purchased",                 :default => 0,        :null => false
    t.string   "site_standing",  :limit => 30,  :default => "editor", :null => false
    t.string   "billing_type",   :limit => 20
    t.datetime "created_at",                                          :null => false
    t.datetime "updated_at",                                          :null => false
  end

  create_table "sites_view", :id => false, :force => true do |t|
    t.integer  "id",                            :default => 0, :null => false
    t.integer  "company_id",                                   :null => false
    t.integer  "template_id"
    t.integer  "emr_company_id"
    t.string   "emr_link",       :limit => 100
    t.string   "practice_name"
    t.integer  "specialty_id"
    t.string   "specialty"
    t.string   "discipline"
    t.text     "slogan"
    t.string   "step"
    t.text     "custom_data"
    t.integer  "has_purchased",                 :default => 0, :null => false
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
    t.integer  "site_id",                       :default => 0, :null => false
    t.string   "emr_name"
    t.integer  "emr_id",                        :default => 0
  end

  create_table "sites_widgets", :force => true do |t|
    t.integer  "site_id",    :null => false
    t.integer  "widget_id",  :null => false
    t.integer  "order",      :null => false
    t.text     "container"
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sites_widgets", ["site_id"], :name => "sites_widgets_site_id_foreign"
  add_index "sites_widgets", ["widget_id"], :name => "sites_widgets_widget_id_foreign"

  create_table "specialty_complete_alerts", :force => true do |t|
    t.integer  "site_id",                    :null => false
    t.integer  "specialty_id",               :null => false
    t.string   "email",        :limit => 80, :null => false
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  add_index "specialty_complete_alerts", ["site_id"], :name => "specialty_complete_alerts_site_id_foreign"

  create_table "specialty_content_tmpl", :force => true do |t|
    t.integer  "page_type_id",         :null => false
    t.integer  "specialty_id",         :null => false
    t.string   "specialty"
    t.integer  "page_content_tmpl_id", :null => false
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "specialty_templates", :force => true do |t|
    t.integer  "template_id",  :null => false
    t.integer  "specialty_id", :null => false
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "specialty_templates", ["template_id"], :name => "specialty_templates_template_id_foreign"

  create_table "staff_view", :id => false, :force => true do |t|
    t.integer  "id",                           :default => 0, :null => false
    t.integer  "site_id",                                     :null => false
    t.string   "prefix",         :limit => 20
    t.string   "firstname",      :limit => 65
    t.string   "initial",        :limit => 1
    t.string   "lastname",       :limit => 65
    t.string   "suffix",         :limit => 5
    t.string   "position",       :limit => 65
    t.integer  "experience",                   :default => 0, :null => false
    t.string   "gender"
    t.string   "photo"
    t.text     "biography"
    t.string   "title"
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
    t.integer  "photo_media_id"
    t.integer  "cv_media_id"
    t.string   "him_her",        :limit => 3
    t.string   "his_her",        :limit => 3
    t.string   "he_she",         :limit => 3
    t.string   "uc_he_she",      :limit => 3
    t.string   "uc_his_her",     :limit => 3
  end

  create_table "state_insurances", :force => true do |t|
    t.string "state"
    t.string "insurance_name"
  end

  create_table "subregions", :force => true do |t|
    t.integer "region_id", :null => false
    t.string  "name"
    t.string  "timezone"
  end

  create_table "template_banner_images", :force => true do |t|
    t.integer  "template_id",  :null => false
    t.string   "banner_image"
    t.string   "image"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "template_banner_images", ["template_id"], :name => "template_banner_images_template_id_foreign"

  create_table "template_data", :force => true do |t|
    t.integer "template_id",                                                                         :null => false
    t.string  "font_family",         :limit => 100, :default => "Arial,Tahoma,Helvetica,sans-serif", :null => false
    t.string  "font_size",           :limit => 65,  :default => "15px",                              :null => false
    t.string  "font_color",          :limit => 65,  :default => "#ffffff",                           :null => false
    t.string  "main_color",          :limit => 65,  :default => "#186f9c",                           :null => false
    t.string  "accent_color",        :limit => 65,  :default => "#88501e",                           :null => false
    t.string  "logo_image",          :limit => 65,  :default => "true",                              :null => false
    t.string  "logo_width",          :limit => 65,  :default => "80px",                              :null => false
    t.string  "highlights",          :limit => 65,  :default => "true",                              :null => false
    t.string  "highlights_num",      :limit => 65,  :default => "4",                                 :null => false
    t.string  "social_media_top",    :limit => 65,  :default => "false",                             :null => false
    t.string  "social_media_bottom", :limit => 65,  :default => "true",                              :null => false
    t.string  "top_nav_color",       :limit => 65,  :default => "#ffffff",                           :null => false
    t.string  "footer_navigation",   :limit => 65,  :default => "false",                             :null => false
    t.string  "slogan_bar",          :limit => 65,  :default => "false",                             :null => false
  end

  add_index "template_data", ["template_id"], :name => "template_data_template_id_foreign"

  create_table "template_files", :force => true do |t|
    t.integer  "template_id", :null => false
    t.string   "name"
    t.string   "path"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "template_files", ["template_id"], :name => "template_files_template_id_foreign"

  create_table "template_plugins", :force => true do |t|
    t.integer "template_id",    :null => false
    t.integer "code_plugin_id", :null => false
  end

  add_index "template_plugins", ["template_id"], :name => "template_plugins_template_id_foreign"

  create_table "templates", :force => true do |t|
    t.string   "name"
    t.binary   "active",         :limit => 1
    t.string   "path"
    t.text     "description"
    t.string   "thumbnail_path"
    t.string   "preview_path"
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
    t.boolean  "in_production",                                :null => false
  end

  add_index "templates", ["name"], :name => "name", :unique => true

  create_table "tmpl_keys", :force => true do |t|
    t.string   "key"
    t.string   "key_type"
    t.string   "origin_table"
    t.string   "origin_field"
    t.string   "static_value"
    t.string   "description"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "tmplkey_entities", :force => true do |t|
    t.integer  "tmpl_key_id", :null => false
    t.string   "entity"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "tmplkey_entities", ["tmpl_key_id"], :name => "tmplkey_entities_tmpl_key_id_foreign"

  create_table "user_audit", :force => true do |t|
    t.integer  "user_id",     :null => false
    t.string   "server_info"
    t.text     "user_data"
    t.string   "location"
    t.string   "ip_address"
    t.datetime "created_at",  :null => false
  end

  create_table "user_coupons", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.integer  "coupon_id",  :null => false
    t.datetime "created_at", :null => false
  end

  add_index "user_coupons", ["user_id"], :name => "user_coupons_user_id_foreign"

  create_table "user_nag_logs", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "user_nag_logs", ["user_id"], :name => "user_nag_logs_user_id_foreign"

  create_table "user_sites", :force => true do |t|
    t.integer "user_id", :null => false
    t.integer "site_id", :null => false
  end

  add_index "user_sites", ["site_id"], :name => "user_sites_usite_id_foreign"
  add_index "user_sites", ["user_id"], :name => "user_sites_user_id_foreign"

  create_table "user_temp_passwords", :force => true do |t|
    t.integer   "user_id",                  :null => false
    t.string    "hash",       :limit => 80
    t.integer   "used",                     :null => false
    t.timestamp "expires",                  :null => false
    t.datetime  "created_at",               :null => false
    t.datetime  "updated_at",               :null => false
  end

  add_index "user_temp_passwords", ["user_id"], :name => "user_temp_passwords_user_id_foreign"

  create_table "users", :force => true do |t|
    t.integer  "reseller_id",                                    :null => false
    t.integer  "role_id",                                        :null => false
    t.string   "login"
    t.string   "password"
    t.string   "cookie_hash"
    t.string   "purchased"
    t.integer  "confirmed",                       :default => 0
    t.string   "confirmation_code", :limit => 70
    t.string   "primary"
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
  end

  add_index "users", ["reseller_id"], :name => "users_reseller_id_foreign"

  create_table "widgets", :force => true do |t|
    t.text     "name"
    t.text     "default_container"
    t.integer  "default_order",     :null => false
    t.text     "content_path"
    t.text     "default_data"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

end
