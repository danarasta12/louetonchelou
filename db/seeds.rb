require "faker"
require "date"
require 'open-uri'

puts "Destroy user"
Talent.destroy_all
User.destroy_all

puts "Creating 20 users"

20.times do
  user = User.create!(
    email: Faker::Internet.email,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    password: Faker::Alphanumeric.alphanumeric(number: 10),
    sex: ["homme", "femme"].sample,
    date_of_birth: Date.new(rand(1980..2005), rand(1..12), rand(1..29)),
    chelou?: [true, false].sample
  )

  file = URI.open('https://source.unsplash.com/random/?face')
  user.profile_picture.attach(io: file, filename: "#{user.last_name}.png", content_type: 'image/png')

  puts "#{user.first_name} created"

  if user.chelou?
    puts "Creating talent for #{user.first_name}"
    talent = Talent.new(
      user: user,
      pseudo: Faker::Movies::HarryPotter.character,
      working_area: ["75", "77", "78", "91", "92", "93", "94", "95"].sample,
      talent_type: ["Cracheur de Feu", "Stripteaseur", "Dompteur de Serpents", "Clown", "Magicien"].sample,
      price: rand(10..500).to_f,
      performance_duration: rand(10..120).to_s,
      # medias: "https://source.unsplash.com/random/?party",
      description: Faker::Movies::HarryPotter.quote,
    )
    file = URI.open('https://source.unsplash.com/random/?party')
    talent.medias.attach(io: file, filename: "#{talent.pseudo}.png", content_type: 'image/png')

    talent.save!
    puts "#{talent.pseudo} created"
  end
end
# Booking.create(
#   start_date: Date.new(2023, rand(1..12), rand(1..29)),
#   end_date: Date.new(2023, 12, 12),
#   address: '18 Villa Gaudelet, 75011 Paris'
# )

puts "1 booking created"
puts "Done"
