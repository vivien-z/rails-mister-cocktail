require 'open-uri'
require 'json'

puts "destroying records..."

Ingredient.destroy_all

puts "start seeding..."

# create option list for ingredients
url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'

list = JSON.parse(open(url).read)
ingredients = list['drinks'].first(18)

ingredients.each do |i|
  ingredient = i['strIngredient1']
  Ingredient.create(name: ingredient)
end

# create users
user_1 = User.create!(username: "mango", email: "a@cocktail.com", password: "123456")
user_2 = User.create!(username: "dingolingo", email: "b@cocktail.com", password: "123456")

# create cocktails
cocktail_1 = Cocktail.new(name: "Mojito")
cocktail_1.user = user_1
cocktail_1.photo.attach(io: file, filename: 'mojito.jpg', content_type: 'image/jpg')
cocktail_1.save!

cocktail_2 = Cocktail.new(name: "Pink Lady")
cocktail_2.user = user_1
cocktail_2.photo.attach(io: file, filename: 'pink-lady.jpg', content_type: 'image/jpg')
cocktail_2.save!

cocktail_3 = Cocktail.new(name: "Long Island Iced Tea")
cocktail_3.user = user_2
cocktail_3.photo.attach(io: file, filename: 'long-island.jpg', content_type: 'image/jpg')
cocktail_3.save!

cocktail_4 = Cocktail.new(name: "Pina Colada")
cocktail_4.user = user_2
cocktail_4.photo.attach(io: file, filename: 'pina-colada.jpg', content_type: 'image/jpg')
cocktail_4.save!

cocktail_5 = Cocktail.new(name: "Margarita")
cocktail_5.user = user_1
cocktail_5.photo.attach(io: file, filename: 'margarita.jpg', content_type: 'image/jpg')
cocktail_5.save!

cocktail_6 = Cocktail.new(name: "Mai Tai")
cocktail_6.user = user_1
cocktail_6.photo.attach(io: file, filename: 'mai-tai.jpg', content_type: 'image/jpg')
cocktail_6.save!

cocktail_7 = Cocktail.new(name: "Blue Ocean")
cocktail_7.user = user_1
cocktail_7.photo.attach(io: file, filename: 'blue.jpg', content_type: 'image/jpg')
cocktail_7.save!

puts "done seeding..."
