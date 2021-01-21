if User.first.nil?
  users = User.create!([{ login: 'alice', password: '12345678' },
                        { login: 'bob', password: '87654321' }])
end

if Category.first.nil?
  categories = Category.create!([{ title: 'math' }, { title: 'programming' }])
end

if Test.first.nil?
  tests = Test.create!([{ title: 'arithmetic', level: 0, category: categories.first, creator: users.first},
                        { title: 'x86_64 assembly', level: 3, category: categories.second, creator: users.second }])
end

if Question.first.nil?
  questions = Question.create!([{ test: tests.first, statement: 'reduce 2 + 5' },
                                { test: tests.first, statement: 'reduce 2 * 5' },
                                { test: tests.first, statement: 'reduce 2 + 2 * 2' },
                                { test: tests.second, statement: 'what this instruction does: xorq %rax, %rax?' },
                                { test: tests.second, statement: 'are these instructions the same: movq %rax, %rdi and leaq (%rax), %rdi?' },
                                { test: tests.second, statement: 'what this instruction does: cld?' }])
end

if Answer.first.nil?
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
end

if Result.first.nil?
  Result.create!([{ user: users.first, test: tests.second, points: 2 },
                  { user: users.second, test: tests.first, points: 3 }])
end
