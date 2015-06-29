# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create({
  full_name: "管理 する太郎",
  nick_name: "カンちゃん",
  job_type:  :general,
  admin: true
})

User.create({
  full_name: "一般 人ノ助",
  nick_name: "パンピー",
  job_type:  :engineer
})
