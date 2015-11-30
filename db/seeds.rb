# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

g = Group.find_or_create_by(name: 'Byt Brno')

m1 = Member.find_or_create_by(name: 'Standa', admin: false, group_id: g.id, color_id: 0)
m2 = Member.find_or_create_by(name: 'Jirka',  admin: false, group_id: g.id, color_id: 1)
m3 = Member.find_or_create_by(name: 'Honza',  admin: false, group_id: g.id, color_id: 4)
m4 = Member.find_or_create_by(name: 'Pavel',  admin: false, group_id: g.id, color_id: 6)

Task.find_or_create_by(description: 'Vyluxovat', due_date: Date.new(2015, 12, 24), group_id: g.id, member_id: m1.id, points: 200, points_original: 200, done: false)
Task.find_or_create_by(description: 'Vynest kos', due_date: Date.new(2015, 12, 24), group_id: g.id, member_id: m2.id, points: 100, points_original: 100, done: false)
Task.find_or_create_by(description: 'Umyt nadobi', due_date: Date.new(2015, 12, 24), group_id: g.id, member_id: m3.id, points: 100, points_original: 100, done: false)
Task.find_or_create_by(description: 'Utrit prach', due_date: Date.new(2015, 12, 24), group_id: g.id, member_id: m4.id, points: 200, points_original: 200, done: false)
Task.find_or_create_by(description: 'Umyt podlahu', due_date: Date.new(2015, 12, 24), group_id: g.id, member_id: m1.id, points: 200, points_original: 200, done: false)
Task.find_or_create_by(description: 'Umyt koupelnu', due_date: Date.new(2015, 12, 24), group_id: g.id, member_id: m1.id, points: 250, points_original: 250, done: false)
