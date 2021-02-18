unless User.exists?
  users = User.create!([{ login: 'alice', password: '12345678' },
                        { login: 'bob', password: '87654321' }])

  categories = Category.create!([{ title: 'math' }, { title: 'programming' }])

  tests = Test.create!([{ title: 'arithmetic', level: 0, category: categories.first, creator: users.first},
                        { title: 'x86_64 assembly', level: 3, category: categories.second, creator: users.second }])

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

end
