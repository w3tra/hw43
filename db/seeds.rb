# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
images_path = "#{Rails.root}/app/assets/images/"
photos = [(images_path+"photo1.jpeg"), (images_path+"photo2.jpg"), (images_path+"photo3.jpeg")]
5.times do
  Place.create(title: Faker::Company.name, description: Faker::Company.bs, image: File.new(photos.sample))
end

prices = [250, 350, 15, 8, 90, 122, 900]

Place.all.each do |place|
  3.times do
    place.items.create(title: Faker::Beer.name, price: prices.sample)
  end
end
n = 0
5.times do
  n += 1
  User.create(password: "qweqwe", email: "mail#{n}@mail.ru")
end