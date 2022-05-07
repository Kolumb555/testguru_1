# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create!([{ title: 'Frontend' }, { title: 'Backend' }, { title: 'Machine Learning' }])

users = User.create!([{ name: 'Yukihiro', last_name: 'Matsumoto', email: 'yuki@gmail.com', password: '1234qwer' },
{ name: 'Guido', last_name: 'Rossum', email: 'gvr@yahoo.com', password: '4321rewq' }])

tests = Test.create!([
  { title: 'JavaScript', level: 1, category_id: categories[0].id, author_id: users[0].id, public: true },
  { title: 'Ruby', level: 3, category_id: categories[1].id, author_id: users[0].id, public: true },
  { title: 'Python', level: 4, category_id: categories[2].id, author_id: users[0].id, public: true },
  { title: 'CSS', level: 2, category_id: categories[0].id, author_id: users[1].id },
  { title: 'React', level: 5, category_id: categories[0].id, author_id: users[1].id }])

questions = Question.create([
  { body:'The act of adding notes to document functions and steps in your code is called ____.', test_id: tests[1].id },
  { body:'Because Ruby is an interpreted language, it means that the source code is compiled and executed at ____?', test_id: tests[1].id },
  { body:'What is the Ruby element that has a data set with start and end values, intended to keep a logical sequence of values in-between also?', test_id: tests[1].id },
  { body:'What is the name of the element used to dictate when an operation needs to be performed?', test_id: tests[1].id },
  { body:'Two primary advantages of using an interpreted language are that development is available across ____ and hardware architectures.', test_id: tests[1].id },
  { body:'Variables that are accessible only in the code construct in which they are declared are called what?', test_id: tests[1].id },
  { body:'What is the name of the element that is used to define what an object looks like after it is created??', test_id: tests[1].id },
  { body:'Variables that are accessible anywhere in a Ruby program regardless of scope are called what?', test_id: tests[1].id },
  { body:'What is the name of a stored value – primarily used for reference purposes – that can include an integer, string, or character?', test_id: tests[1].id },
  { body:'What is the Ruby element that is used to store data for the entire duration of a program’s execution?', test_id: tests[1].id },
  { body: "What will be the output of this code: console.log(false == '0');?", test_id: tests[0].id },
  { body:'What will be the output of this code: console.log(String.raw`HelloTwitter\nworld`);?', test_id: tests[0].id },
  { body:'What will be the output of this code: console.log(1 +  "2" + "2");?', test_id: tests[0].id }])


replies = Reply.create([{body: 'Sharing', question_id: questions[0].id, correct: false },
  { body: 'Communicating', question_id: questions[0].id, correct: false },
  { body: 'Commenting', question_id: questions[0].id, correct: true },
  { body: 'Notating', question_id: questions[0].id, correct: false },

  { body: 'After lunch', question_id: questions[1].id, correct: false },
  { body: 'Later', question_id: questions[1].id, correct: false },
  { body: 'Before', question_id: questions[1].id, correct: false },
  { body: 'Runtime', question_id: questions[1].id, correct: true },

  { body: 'Range', question_id: questions[2].id, correct: true },
  { body: 'Box', question_id: questions[2].id, correct: false },
  { body: 'Median', question_id: questions[2].id, correct: false },
  { body: 'Package', question_id: questions[2].id, correct: false },

  { body: 'Variable', question_id: questions[3].id, correct: false },
  { body: 'Declaration', question_id: questions[3].id, correct: false },
  { body: 'Operator', question_id: questions[3].id, correct: true },
  { body: 'Assignment', question_id: questions[3].id, correct: false },

  { body: 'Servers', question_id: questions[4].id, correct: false },
  { body: 'System', question_id: questions[4].id, correct: false },
  { body: 'Platform', question_id: questions[4].id, correct: true },
  { body: 'Devices', question_id: questions[4].id, correct: false },

  { body: 'Wide Variables', question_id: questions[5].id, correct: false },
  { body: 'Temporary Variables', question_id: questions[5].id, correct: false },
  { body: 'Local Variables', question_id: questions[5].id, correct: true },
  { body: 'Global Variables', question_id: questions[5].id, correct: false },

  { body: 'Object', question_id: questions[6].id, correct: false },
  { body: 'Class', question_id: questions[6].id, correct: true },
  { body: 'Keyword', question_id: questions[6].id, correct: false },
  { body: 'String', question_id: questions[6].id, correct: false },

  { body: 'Local Variables', question_id: questions[7].id, correct: false },
  { body: 'Global Variables', question_id: questions[7].id, correct: true },
  { body: 'Wide Variables', question_id: questions[7].id, correct: false },
  { body: 'Temporary Variables', question_id: questions[7].id, correct: false },

  { body: 'Expression', question_id: questions[8].id, correct: false },
  { body: 'Function', question_id: questions[8].id, correct: false },
  { body: 'Variable', question_id: questions[8].id, correct: true },
  { body: 'Constant', question_id: questions[8].id, correct: false },

  { body: 'Function', question_id: questions[9].id, correct: false },
  { body: 'Variable', question_id: questions[9].id, correct: false },
  { body: 'Expression', question_id: questions[9].id, correct: false },
  { body: 'Constant', question_id: questions[9].id, correct: true },

  { body: 'false', question_id: questions[10].id, correct: false },
  { body: 'true', question_id: questions[10].id, correct: true },

  { body: 'HelloTwitter\nworld', question_id: questions[11].id, correct: true },
  { body: 'HelloTwitter world', question_id: questions[11].id, correct: false },
  { body: 'Hello Twitter world', question_id: questions[11].id, correct: false },

  { body: '122', question_id: questions[12].id, correct: true },
  { body: '32', question_id: questions[12].id, correct: false },
  { body: 'Nan2', question_id: questions[12].id, correct: false },
  { body: 'Nan', question_id: questions[12].id, correct: false },
  ])