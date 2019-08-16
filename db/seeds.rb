# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(name:"admin",email:"admin@admin.com",password:"admin",admin:true)
User.create(name:"test1",email:"1@t.com",password:"1",admin:false)
User.create(name:"test2",email:"2@t.com",password:"2",admin:false)
User.create(name:"test3",email:"3@t.com",password:"3",admin:false)
User.create(name:"test4",email:"4@t.com",password:"4",admin:false)
User.create(name:"test5",email:"5@t.com",password:"5",admin:false)
User.create(name:"test6",email:"6@t.com",password:"6",admin:false)

Task.create(title:"test",content:"test",status:"着手",priority:"high",user_id:3)
Task.create(title:"test",content:"test",status:"着手",priority:"high",user_id:3)
Task.create(title:"test",content:"test",status:"着手",priority:"high",user_id:3)
Task.create(title:"test",content:"test",status:"",priority:"high",user_id:3)
Task.create(title:"test",content:"test",status:"",priority:"high",user_id:3)
Task.create(title:"test",content:"test",status:"着手",priority:"high",user_id:3)
Task.create(title:"test",content:"test",status:"",priority:"high",user_id:3)
Task.create(title:"test",content:"test",status:"着手",priority:"high",user_id:3)

Task.create(title:"test",content:"test",status:"着手",priority:"high",user_id:4)
Task.create(title:"test",content:"test",status:"着手",priority:"high",user_id:5)
Task.create(title:"test",content:"test",status:"着手",priority:"high",user_id:6)
Task.create(title:"test",content:"test",status:"",priority:"high",user_id:2)
Task.create(title:"test",content:"test",status:"着手",priority:"high",user_id:2)
Task.create(title:"test",content:"test",status:"着手",priority:"high",user_id:5)
Task.create(title:"test",content:"test",status:"着手",priority:"high",user_id:5)
Task.create(title:"test",content:"test",status:"着手",priority:"high",user_id:5)
