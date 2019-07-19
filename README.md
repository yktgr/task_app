# README

create_table "users", force: :cascade do |t|
  t.string   "name"
  t.string   "email_address"
  t.integer  "password_digest"
  t.datetime "created_at"
  t.datetime "updated_at"
end

create_table "labels", force: :cascade do |t|
  t.string   "label_name"
  t.integer  "task_id"
  t.integer   "user_id"  
  t.datetime "created_at"
  t.datetime "updated_at"
end

create_table "tasks", force: :cascade do |t|
  t.string   "title"
  t.string   "content"
  t.string   "status"
  t.integer  "priority"
  t.integer   "user_id"  
  t.datetime "created_at"
  t.datetime "updated_at"
end
