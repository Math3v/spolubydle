# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

g = Group.find_or_create_by(name: 'TestGroup')

m1 = Member.find_or_create_by(name: 'TestMember1', admin: true, group_id: g.id)
m2 = Member.find_or_create_by(name: 'TestMember2', admin: false, group_id: g.id)
m3 = Member.find_or_create_by(name: 'TestMember3', admin: false, group_id: nil)

Task.find_or_create_by(description: 'Wash dishes', due_date: Date.new(2015, 12, 24), group_id: g.id, member_id: m1.id, points: 200, points_original: 200, done: false)
Task.find_or_create_by(description: 'Wash floors', due_date: Date.new(2015, 12, 25), group_id: g.id, member_id: m2.id, points: 100, points_original: 100, done: true)
