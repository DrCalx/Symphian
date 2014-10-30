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
{name:"Alternative Rock"},
{name:"Ambient"},
{name:"Bluegrass"},
{name:"Blues"},
{name:"Children's"},
{name:"Classical"},
{name:"Country"},
{name:"Dance"},
{name:"Deep House"},
{name:"Disco"},
{name:"Drum & Bass"},
{name:"Dubstep"},
{name:"Electro"},
{name:"Electronic"},
{name:"Folk"},
{name:"Funk"},
{name:"Gospel"},
{name:"Hardcore Techno"},
{name:"Hip Hop"},
{name:"House"},
{name:"Indie Rock"},
{name:"Jazz"},
{name:"Latin"},
{name:"Metal"},
{name:"Minimal Techno"},
{name:"Piano"},
{name:"Pop"},
{name:"Progressive House"},
{name:"Punk"},
{name:"R&B"},
{name:"Rap"},
{name:"Reggae"},
{name:"Rock"},
{name:"Singer-Songwriter"},
{name:"Soul"},
{name:"Tech House"},
{name:"Techno"},
{name:"Trance"},
{name:"Trap"},
{name:"Trip Hop"},
{name:"World"},
{name:"Worship"},
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