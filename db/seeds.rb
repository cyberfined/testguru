def create_users!(users, constructor)
  users.map! { |u| constructor.call(u) }
  users.each do |u|
    u.skip_confirmation!
    u.save!
  end
end

unless User.exists?
  admins = [{ first_name: 'alice', last_name: 'hacker', email: 'alice@example.com', password: '12345678' },
            { first_name: 'ben', last_name: 'bitdiddle', email: 'ben@example.com', password: '87654321' }]
  create_users!(admins, Admin.method(:new))

  users = [{ first_name: 'john', last_name: 'xeta', email: 'xeta@example.com', password: '12345678' }]
  create_users!(users, User.method(:new))

  categories = Category.create!([{ title: 'math' }, { title: 'programming' }])

  tests = Test.create!([{ title: 'arithmetic', level: 0, category: categories.first, creator: admins.first, timer: 2 },
                        { title: 'x86_64 assembly', level: 3, category: categories.second, creator: admins.second }])

  questions = Question.create!([{ test: tests.first, statement: 'reduce 2 + 5' },
                                { test: tests.first, statement: 'reduce 2 * 5' },
                                { test: tests.first, statement: 'reduce 2 + 2 * 2' },
                                { test: tests.second, statement: 'what this instruction does: xorq %rax, %rax?' },
                                { test: tests.second, statement: 'are these instructions the same: movq %rax, %rdi and leaq (%rax), %rdi?' },
                                { test: tests.second, statement: 'what this instruction does: cld?' }])

  answers = Answer.create!([{ question: questions[0], statement: '7', correct: true },
                            { question: questions[0], statement: '8', correct: false },
                            { question: questions[1], statement: '7', correct: false },
                            { question: questions[1], statement: '10', correct: true },
                            { question: questions[2], statement: '8', correct: false },
                            { question: questions[2], statement: '6', correct: true },
                            { question: questions[3], statement: 'set rax to zero', correct: true },
                            { question: questions[3], statement: 'add rax to itself', correct: false },
                            { question: questions[4], statement: 'no, they don\'t', correct: false },
                            { question: questions[4], statement: 'yes, they are', correct: true },
                            { question: questions[5], statement: 'clear direction flag', correct: true },
                            { question: questions[5], statement: 'reboot a computer', correct: false }])


  rules = Rule.create!([{ title: 'first try' },
                        { title: 'category passage' },
                        { title: 'level passage' }])

  badges = Badge.create!([{ title: 'assembly hero', image_url: '/badge_01.png', rule: rules[0],
                            rule_argument: tests.second.id },
                          { title: 'third hero', image_url: '/badge_02.png', rule: rules[2],
                            rule_argument: 3 },
                          { title: 'math hero', image_url: '/badge_03.png', rule: rules[1],
                            rule_argument: categories.first.id }])
end
