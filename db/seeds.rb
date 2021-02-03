# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create(title: 'Frontend')
Category.create(title: 'Backend')
Category.create(title: 'Machine Learning')

Test.create(title: 'JavaScript', level: 1, category_id: 1)
Test.create(title: 'Ruby', level: 3, category_id: 2)
Test.create(title: 'Python', level: 4, category_id: 3)
Test.create(title: 'CSS', level: 2, category_id: 1)
Test.create(title: 'React', level: 5, category_id: 1)

Question.create(body:'What is an object?', test_id: 2)
Question.create(body:'What does self mean?', test_id: 2)
Question.create(body:'What is a Proc?', test_id: 2)
Question.create(body:'What does CSS stand for?', test_id: 4)
Question.create(body:'What is the best way to split a string?', test_id: 3)

Reply.create(body: 'Object is the parent class of all classes in Ruby', question_id: 1)
Reply.create(body: 'The keyword self enables to access to the current object', question_id: 2)
Reply.create(body: 'A Proc object is an encapsulation of a block of code, which can be stored in a local variable', question_id: 3)
Reply.create(body: 'Cascading style sheets', question_id: 4)
Reply.create(body: 'Using .split', question_id: 5)

User.create(name: 'Yukihiro Matsumoto')
User.create(name: 'Guido van Rossum')
