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

ActiveRecord::Schema.define(version: 20150405111413) do

  create_table "dashboards", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "drugs", force: :cascade do |t|
    t.text     "reference",  limit: 65535
    t.string   "name",       limit: 255
    t.string   "atc",        limit: 255
    t.string   "drugbank",   limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "genes", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "sequence",    limit: 255
    t.text     "reference",   limit: 65535
    t.string   "uniprot",     limit: 255
    t.string   "symbol",      limit: 255
    t.integer  "isolated_id", limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "genes", ["isolated_id"], name: "index_genes_on_isolated_id", using: :btree

  create_table "isolateds", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "disease",     limit: 255
    t.integer  "n_samples",   limit: 4
    t.integer  "origin_id",   limit: 4
    t.integer  "organism_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "isolateds", ["organism_id"], name: "index_isolateds_on_organism_id", using: :btree
  add_index "isolateds", ["origin_id"], name: "index_isolateds_on_origin_id", using: :btree

  create_table "mutations", force: :cascade do |t|
    t.string   "nucleotide", limit: 255
    t.string   "aminoacid",  limit: 255
    t.string   "hgvs",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "mutpubs", force: :cascade do |t|
    t.integer  "mutation_id",    limit: 4
    t.integer  "publication_id", limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "mutpubs", ["mutation_id"], name: "index_mutpubs_on_mutation_id", using: :btree
  add_index "mutpubs", ["publication_id"], name: "index_mutpubs_on_publication_id", using: :btree

  create_table "organisms", force: :cascade do |t|
    t.integer  "tax_org",    limit: 4
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "origins", force: :cascade do |t|
    t.string   "origin_t",   limit: 255
    t.string   "lab_name",   limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "publications", force: :cascade do |t|
    t.string   "author",     limit: 255
    t.string   "title",      limit: 255
    t.date     "date"
    t.string   "journal",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "resists", force: :cascade do |t|
    t.integer  "mic",         limit: 4
    t.integer  "drug_id",     limit: 4
    t.integer  "isolated_id", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "resists", ["drug_id"], name: "index_resists_on_drug_id", using: :btree
  add_index "resists", ["isolated_id"], name: "index_resists_on_isolated_id", using: :btree

  create_table "stats", force: :cascade do |t|
    t.integer  "n_studies",   limit: 4
    t.text     "info",        limit: 65535
    t.integer  "gene_id",     limit: 4
    t.integer  "mutation_id", limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "stats", ["gene_id"], name: "index_stats_on_gene_id", using: :btree
  add_index "stats", ["mutation_id"], name: "index_stats_on_mutation_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "genes", "isolateds"
  add_foreign_key "isolateds", "organisms"
  add_foreign_key "isolateds", "origins"
  add_foreign_key "mutpubs", "mutations"
  add_foreign_key "mutpubs", "publications"
  add_foreign_key "resists", "drugs"
  add_foreign_key "resists", "isolateds"
  add_foreign_key "stats", "genes"
  add_foreign_key "stats", "mutations"
end
