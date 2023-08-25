# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

20.times do
  Jet.create([
    {
      name: Faker::Drone.name,
      model: Faker::Vehicle.vin,
      capacity: [1..14].sample,
      jetType: JETTYPE.sample,
      location: Faker::Address.full_address,
      price: [10000..100000].sample,
      user_id: 1
    }
  ])
end
