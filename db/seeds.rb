# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
Post.delete_all

user1 = User.create(name: "Jack", email: "jack@jack.biz")
user2 = User.create(name:"Zack", email:"zack@zack.mobi")



post1 = Post.create(title:'Something amazing', content:'Like, some seriously intriguing content here or something like that', user_id:'2')
post2 = Post.create(title:'Something else is awesome', content:'WHOA!', user_id:'2')
