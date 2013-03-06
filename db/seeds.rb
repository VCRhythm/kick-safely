# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Factor.create name:'budget', effect:1
Factor.create name:'featured', effect:2
Factor.create name:'video', effect:1

Skill.create name:'business'
Skill.create name:'art'
Skill.create name:'film'
Skill.create name:'law'
