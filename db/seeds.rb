# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create(fullName: "Mohamed Shawky", password: "1231231233", email: "mazika906@gmail.com",avatarUrl:"")
owner = Owner.create(name:"Test Owner",address:"test",number:"010600",user_id:user.id)
housing = Housing.create(housingName:"Normal Housing")
chicken = Bird.create(bird_name:'Chicken')
breeds = Breed.create(breed_name:"White Chicken",bird_id:chicken.id)
food = Food.create(food_name:'Normal Food')
