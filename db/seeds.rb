# Seeding with Harry Potter characters
# And associating wands
require 'faker'

NAMES = %w[Harry\ Potter Draco\ Malfoy Hermione\ Granger Ron\ Weasley Neville\ Longbottom Luna\ Lovegood Rúbeo\ Hagrid Sirius\ Black Fleur\ Delacour James\ Potter Lilian\ Potter]

puts('Seeding users!')
NAMES.each do |name|
  puts("Creating user #{name}")
  name = name.split(' ')
  first_name = name.first
  last_name = name.last
  user = User.new(
    email: "#{first_name}.#{last_name}@email.com",
    password: '123456',
    password_confirmation: '123456',
    first_name: first_name,
    last_name: last_name
  )
  user.save!

  puts("Creating a wand for #{name}")
  3.times do
    Wand.create!(
      name: Faker::Cosmere.shard_world,
      core: Wand::CORE.sample,
      wood: Wand::WOOD.sample,
      manufacture: Wand::MANUFACTURE.sample,
      price: rand(20..100),
      quantity: rand(1..10),
      previous_owners: NAMES.sample,
      available: [true, false].sample,
      user: user
    )
  end
end
