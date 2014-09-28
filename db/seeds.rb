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
{name:"Baritone Horn", category:"Woodwind"},
{name:"Acoustic Bass", category:"Woodwind"},
{name:"Electric Bass", category:"Woodwind"},
{name:"Bassoon", category:"Woodwind"},
{name:"Cello", category:"Woodwind"},
{name:"Clarinet", category:"Woodwind"},
{name:"Electronics", category:"Woodwind"},
{name:"Flute", category:"Woodwind"},
{name:"French Horn", category:"Woodwind"},
].each do |inst|
	Instrument.find_or_create_by_name(inst)
end

[
{name:"Folk"},
{name:"Bluegrass"},
{name:"Blues"},
{name:"Children's"},
{name:"Electronic"},
{name:"Funk"},
{name:"Rock"},
{name:"Classical"},
{name:"Gospel"},
{name:"Hip Hop"},
{name:"Metal"},
{name:"Pop"},
{name:"Reggae"},
{name:"Worship"},
{name:"Jazz"},
{name:"Country"},
].each do |genre|
	Genre.find_or_create_by_name(genre)
end

[
{name:"Part Time"},
{name:"Full Time"},
{name:"Jam"},
{name:"Gig"},
{name:"Lessons"},
{name:"Internship"},
{name:"Contract"},
{name:"Band"},
{name:"Ensemble"},
].each do |type|
	ListingType.find_or_create_by_name(type)
end