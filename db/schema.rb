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

ActiveRecord::Schema.define(version: 20150316225051) do

  create_table "drugs", force: :cascade do |t|
    t.integer  "reference"
    t.string   "name"
    t.string   "atc"
    t.string   "drugbank"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genes", force: :cascade do |t|
    t.string   "name"
    t.string   "sequence"
    t.integer  "reference"
    t.string   "uniprot"
    t.string   "symbol"
    t.integer  "isolated_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "genes", ["isolated_id"], name: "index_genes_on_isolated_id"

  create_table "haves", force: :cascade do |t|
    t.integer  "mutation_id"
    t.integer  "publication_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "haves", ["mutation_id"], name: "index_haves_on_mutation_id"
  add_index "haves", ["publication_id"], name: "index_haves_on_publication_id"

  create_table "isolateds", force: :cascade do |t|
    t.string   "name"
    t.string   "disease"
    t.integer  "n_samples"
    t.integer  "origin_id"
    t.integer  "organism_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "isolateds", ["organism_id"], name: "index_isolateds_on_organism_id"
  add_index "isolateds", ["origin_id"], name: "index_isolateds_on_origin_id"

  create_table "mutations", force: :cascade do |t|
    t.string   "nucleotide"
    t.string   "aminoacid"
    t.string   "hgvs"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mutpubs", force: :cascade do |t|
    t.integer  "mutation_id"
    t.integer  "publication_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "mutpubs", ["mutation_id"], name: "index_mutpubs_on_mutation_id"
  add_index "mutpubs", ["publication_id"], name: "index_mutpubs_on_publication_id"

  create_table "organisms", force: :cascade do |t|
    t.integer  "tax_org"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "origins", force: :cascade do |t|
    t.string   "origin_t"
    t.string   "lab_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "publications", force: :cascade do |t|
    t.string   "author"
    t.string   "title"
    t.date     "date"
    t.string   "journal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "resists", force: :cascade do |t|
    t.string   "reference"
    t.integer  "mic"
    t.integer  "drug_id"
    t.integer  "isolated_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "resists", ["drug_id"], name: "index_resists_on_drug_id"
  add_index "resists", ["isolated_id"], name: "index_resists_on_isolated_id"

  create_table "stats", force: :cascade do |t|
    t.integer  "n_studies"
    t.text     "info"
    t.integer  "gene_id"
    t.integer  "mutation_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "stats", ["gene_id"], name: "index_stats_on_gene_id"
  add_index "stats", ["mutation_id"], name: "index_stats_on_mutation_id"

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
