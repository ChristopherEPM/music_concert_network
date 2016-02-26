# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

5.times.each_with_index do |index|

  Concert.create(
    artist: "artist #{index}",
    venue:  "Venue  where going to be the concert #{index}",
    city: "City where where is going to be the concert #{index}",
    price: rand(10.0..100.0).round(2),
    description: "this the description  for the concert #{index}",
    date: Time.now + rand(10).days
    )
end
