# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar")
99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

Skill.create!(name: 'C++')
Skill.create!(name: 'Ruby')
Skill.create!(name: 'Rails')
Skill.create!(name: 'Java')
Skill.create!(name: 'Unity')
Skill.create!(name: 'php')
Skill.create!(name: 'Python')
Skill.create!(name: 'C#')
Skill.create!(name: 'Lisp')
Skill.create!(name: 'Illustrator')
Skill.create!(name: 'AfterEffects')
Skill.create!(name: 'HTML+CSS')
Skill.create!(name: 'javascript')

users = User.all
user = users.first
skills = Skill.all
skill = skills.first
user.plus_one(user,skill)
followers = users[2..20]
skill = skills[2]
followers.each { |follower|
  follower.plus_one(user,skill)
}