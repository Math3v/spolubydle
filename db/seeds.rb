# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

g = Group.find_or_create_by(name: 'TestGroup')

Member.find_or_create_by(name: 'TestMember1', admin: true, group_id: g.id)
Member.find_or_create_by(name: 'TestMember2', admin: false, group_id: g.id)
Member.find_or_create_by(name: 'TestMember3', admin: false, group_id: nil)