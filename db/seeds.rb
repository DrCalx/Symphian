# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

[
{name:"Guitar", category:"String"},
{name:"Trumpet", category:"Brass"},
{name:"Drum Kit", category:"Percussion"},
{name:"Bagpipes", category:"Woodwind"},
].each do |inst|
	Instrument.find_or_create_by_name(inst)
end

[
{name:"Folk"},
{name:"Rock"},
{name:"Classical"},
{name:"Jazz"},
{name:"Country"},
].each do |genre|
	Genre.find_or_create_by_name(genre)
end