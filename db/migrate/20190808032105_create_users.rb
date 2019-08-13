class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.references :task, foreign_key: true
      t.string :name ,null: false
      t.string :email, null: false
      t.string :password_digest, null:false
      t.timestamps
    end
  end
end
