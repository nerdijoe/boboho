# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# rake db:seed electronic=yes

if ENV["electronic"]
  cat1 = Category.create(name: "Electronic and Gadgets" )
  subcat11 = Subcategory.create(name: 'Computers', category_id: cat1.id)
  subcat12 = Subcategory.create(name: 'Tvs', category_id: cat1.id)
  subcat11 = Subcategory.create(name: 'Virtual Reality Headsets', category_id: cat1.id)
end

if ENV["videogames"]
  cat2 = Category.create(name: "Video Gaming")
  subcat21 = Subcategory.create(name: 'Video Game Consoles', category_id: cat2.id)
  subcat22 = Subcategory.create(name: 'Video Games', category_id: cat2.id)
  subcat23 = Subcategory.create(name: 'Gaming Accessories', category_id: cat2.id)
end

if ENV["phones"]
  cat3 = Category.create(name: "Mobile Phones & Tablets")
  subcat31 = Subcategory.create(name: 'iPhone', category_id: cat3.id)
  subcat32 = Subcategory.create(name: 'Android Phones', category_id: cat3.id)
  subcat33 = Subcategory.create(name: 'Tablets', category_id: cat3.id)
  subcat34 = Subcategory.create(name: 'Mobile & Tablet Accessories', category_id: cat3.id)
  subcat35 = Subcategory.create(name: 'Mobile Others', category_id: cat3.id)
end

if ENV["electronic2"]
  subcat11 = Subcategory.create(name: 'Gadgets', category_id: 1)
  subcat12 = Subcategory.create(name: 'Cameras', category_id: 1)
end

if ENV["electronic3"]
  subcat13 = Subcategory.create(name: 'Drones', category_id: 1)
  subcat14 = Subcategory.create(name: 'Headphones', category_id: 1)
end
