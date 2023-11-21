require "faker"
require "date"

puts "Destroy user"
User.destroy_all

puts "Creating 20 users"

20.times do
  user = User.create(
    email: Faker::Internet.email,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    password: Faker::Alphanumeric.alphanumeric(number: 10),
    sex: ["homme", "femme"].sample,
    date_of_birth: Date.new(rand(1980..2005), rand(1..12), rand(1..29)),
    chelou?: ["true", "false"].sample
  )

  puts "Creating talent for #{user.id}"

  next user.chelou?
    Talent.create(
      pseudo: Faker::Movies::HarryPotter.character,
      working_area: Faker::Address.state,
      talent_type: ["Cracheur de feu, Stripteaseuse, Dompteur de serpents, Jongleur fou", "Magicien"].sample,
      price: rand(10..500).to_f,
      performance_duration: rand(10..120).to_s,
      medias: "https://source.unsplash.com/random/?party",
      description: Faker::Movies::HarryPotter.quote
    )
end

puts "Done"
