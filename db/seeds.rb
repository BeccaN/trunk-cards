# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
cat_1 = Category.create(name: "Spanish")

# group_1 = Group.create(title: "Ruby Gems", description: "Popular Ruby gems and their purposes")
# group_2 = Group.create(title: "US President Term Years", description: "Years of the terms that each president held office.")
group_1 = Group.create(title: "Spanish Verbs", description: "Collection of Spanish verbs.", category_id: cat_1.id)

group_1.cards.create(front: "ir", back: "to go")
group_1.cards.create(front: "estar", back: "to be")
group_1.cards.create(front: "ser", back: "to be")
group_1.cards.create(front: "tener", back: "to have")
group_1.cards.create(front: "hacer", back: "to do")
group_1.cards.create(front: "venir", back: "to come")
group_1.cards.create(front: "decir", back: "to say")