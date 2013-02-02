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

ActiveRecord::Schema.define(:version => 20130202144506) do

  create_table "survey_response_lines", :force => true do |t|
    t.integer  "survey_response_id"
    t.integer  "survey_template_line_id"
    t.string   "risposta"
    t.integer  "progressivo"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  create_table "survey_responses", :force => true do |t|
    t.integer  "survey_template_id"
    t.string   "azienda"
    t.string   "nome"
    t.string   "cognome"
    t.string   "telefono"
    t.string   "email"
    t.integer  "user_id"
    t.date     "data_compilazione"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "survey_template_lines", :force => true do |t|
    t.integer  "survey_template_id"
    t.string   "domanda"
    t.string   "tipo_dato"
    t.string   "codice"
    t.string   "gruppo"
    t.string   "um"
    t.integer  "progressivo"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "survey_templates", :force => true do |t|
    t.string   "nome"
    t.boolean  "attivo"
    t.string   "categoria"
    t.string   "descrizione"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.string   "linee_guida_file_name"
    t.string   "linee_guida_content_type"
    t.integer  "linee_guida_file_size"
    t.datetime "linee_guida_updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.string   "role"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

end
