# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

cat1 = Category.create(name: "Electronic and Gadgets" )
subcat11 = Subcategory.create(name: 'Computers', category_id: cat1.id)
subcat12 = Subcategory.create(name: 'Tvs', category_id: cat1.id)
subcat11 = Subcategory.create(name: 'Virtual Reality Headsets', category_id: cat1.id)


cat2 = Category.create(name: "Video Gaming")
subcat21 = Subcategory.create(name: 'Video Game Consoles', category_id: cat2.id)
subcat22 = Subcategory.create(name: 'Video Games', category_id: cat2.id)
subcat23 = Subcategory.create(name: 'Gaming Accessories', category_id: cat2.id)
