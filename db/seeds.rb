# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create([{title: 'Frontend'}, {title: 'Backend'}, {title: 'Machine Learning'}])

users = User.create([{name: 'Yukihiro Matsumoto', email: 'yuki@gmail.com'},
{name: 'Guido van Rossum', email: 'gvr@yahoo.com'}])

tests = Test.create([{title: 'JavaScript', level: 1, category_id: categories[0].id, author_id: users[0].id},
{title: 'Ruby', level: 3, category_id: categories[1].id, author_id: users[0].id},
{title: 'Python', level: 4, category_id: categories[2].id, author_id: users[0].id},
{title: 'CSS', level: 2, category_id: categories[0].id, author_id: users[1].id},
{title: 'React', level: 5, category_id: categories[0].id, author_id: users[1].id}])

questions = Question.create([{body:'What is an object?', test_id: tests[1].id},
{body:'What does self mean?', test_id: tests[1].id},
{body:'What is a Proc?', test_id: tests[1].id},
{body:'What does CSS stand for?', test_id: tests[3].id},
{body:'What is the best way to split a string?', test_id: tests[2].id}])

replies = Reply.create([{body: 'Object is the parent class of all classes in Ruby', question_id: questions[0].id},
{body: 'The keyword self enables to access to the current object', question_id: questions[1].id},
{body: 'A Proc object is an encapsulation of a block of code, which can be stored in a local variable', question_id: questions[2].id},
{body: 'Cascading style sheets', question_id: questions[3].id},
{body: 'Using .split', question_id: questions[4].id}])


