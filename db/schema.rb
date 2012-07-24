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

ActiveRecord::Schema.define(:version => 20120724022649) do

  create_table "answers", :force => true do |t|
    t.integer   "question_id"
    t.integer   "response_id"
    t.text      "response_text"
    t.timestamp "created_at",       :null => false
    t.timestamp "updated_at",       :null => false
    t.integer   "questionnaire_id"
    t.integer   "response_value"
  end

  add_index "answers", ["question_id"], :name => "index_answers_on_question_id"
  add_index "answers", ["questionnaire_id"], :name => "index_answers_on_questionnaire_id"
  add_index "answers", ["response_id"], :name => "index_answers_on_response_id"
  add_index "answers", ["response_value"], :name => "index_answers_on_response_value"

  create_table "multianswers", :force => true do |t|
    t.integer   "response_id"
    t.integer   "answer_id"
    t.boolean   "selected"
    t.timestamp "created_at",  :null => false
    t.timestamp "updated_at",  :null => false
    t.integer   "value"
    t.integer   "rank"
  end

  add_index "multianswers", ["answer_id"], :name => "index_multianswers_on_answer_id"
  add_index "multianswers", ["response_id"], :name => "index_multianswers_on_response_id"
  add_index "multianswers", ["selected"], :name => "index_multianswers_on_selected"
  add_index "multianswers", ["value"], :name => "index_multianswers_on_value"

  create_table "questionnaires", :force => true do |t|
    t.integer   "user_id"
    t.timestamp "created_at", :null => false
    t.timestamp "updated_at", :null => false
  end

  create_table "questions", :force => true do |t|
    t.text      "item"
    t.string    "qtype"
    t.text      "instruction"
    t.timestamp "created_at",            :null => false
    t.timestamp "updated_at",            :null => false
    t.integer   "section_id"
    t.integer   "order_id"
    t.integer   "parent_question_id"
    t.integer   "parent_response_value"
  end

  add_index "questions", ["order_id"], :name => "index_questions_on_order_id"
  add_index "questions", ["parent_question_id"], :name => "index_questions_on_parent_question_id"
  add_index "questions", ["parent_response_value"], :name => "index_questions_on_parent_response_value"
  add_index "questions", ["section_id"], :name => "index_questions_on_section_id"

  create_table "regions", :force => true do |t|
    t.string    "label"
    t.timestamp "created_at", :null => false
    t.timestamp "updated_at", :null => false
  end

  create_table "responses", :force => true do |t|
    t.string    "label"
    t.timestamp "created_at",  :null => false
    t.timestamp "updated_at",  :null => false
    t.integer   "question_id"
    t.integer   "value"
    t.text      "definition"
    t.integer   "order_id"
  end

  add_index "responses", ["order_id"], :name => "index_responses_on_order_id"
  add_index "responses", ["question_id"], :name => "index_responses_on_question_id"
  add_index "responses", ["value"], :name => "index_responses_on_value"

  create_table "sections", :force => true do |t|
    t.string    "title"
    t.text      "description"
    t.timestamp "created_at",  :null => false
    t.timestamp "updated_at",  :null => false
    t.integer   "order_id"
  end

  add_index "sections", ["order_id"], :name => "index_sections_on_order_id"

  create_table "users", :force => true do |t|
    t.string    "email",                  :default => "",   :null => false
    t.string    "encrypted_password",     :default => "",   :null => false
    t.string    "reset_password_token"
    t.timestamp "reset_password_sent_at"
    t.timestamp "remember_created_at"
    t.integer   "sign_in_count",          :default => 0
    t.timestamp "current_sign_in_at"
    t.timestamp "last_sign_in_at"
    t.string    "current_sign_in_ip"
    t.string    "last_sign_in_ip"
    t.string    "username"
    t.boolean   "admin"
    t.boolean   "active",                 :default => true
    t.string    "first_name"
    t.string    "last_name"
    t.string    "current_role"
    t.string    "organization"
    t.text      "address"
    t.string    "city"
    t.string    "province"
    t.string    "country"
    t.timestamp "created_at",                               :null => false
    t.timestamp "updated_at",                               :null => false
    t.string    "phone"
    t.integer   "region_id"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["region_id"], :name => "index_users_on_region_id"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
