if User.first.nil?
  users = User.create!([{ login: 'alice', password: '12345678' },
                        { login: 'bob', password: '87654321' }])
end

if Category.first.nil?
  categories = Category.create!([{ title: 'math' }, { title: 'programming' }])
end

if Test.first.nil?
  tests = Test.create!([{ title: 'arithmetic', level: 0, category_id: categories.first.id, creator_id: users.first.id },
                        { title: 'x86_64 assembly', level: 3, category_id: categories.second.id, creator_id: users.second.id }])
end

if Question.first.nil?
  questions = Question.create!([{ test_id: tests.first.id, statement: 'reduce 2 + 5' },
                                { test_id: tests.first.id, statement: 'reduce 2 * 5' },
                                { test_id: tests.first.id, statement: 'reduce 2 + 2 * 2' },
                                { test_id: tests.second.id, statement: 'what this instruction does: xorq %rax, %rax?' },
                                { test_id: tests.second.id, statement: 'are these instructions the same: movq %rax, %rdi and leaq (%rax), %rdi?' },
                                { test_id: tests.second.id, statement: 'what this instruction does: cld?' }])
end

if Answer.first.nil?
  answers = Answer.create!([{ question_id: questions[0].id, statement: '7', correct: true },
                            { question_id: questions[0].id, statement: '8', correct: false },
                            { question_id: questions[1].id, statement: '7', correct: false },
                            { question_id: questions[1].id, statement: '10', correct: true },
                            { question_id: questions[2].id, statement: '8', correct: false },
                            { question_id: questions[2].id, statement: '6', correct: true },
                            { question_id: questions[3].id, statement: 'set rax to zero', correct: true },
                            { question_id: questions[3].id, statement: 'add rax to itself', correct: false },
                            { question_id: questions[4].id, statement: 'no, they don\'t', correct: false },
                            { question_id: questions[4].id, statement: 'yes, they are', correct: true },
                            { question_id: questions[5].id, statement: 'clear direction flag', correct: true },
                            { question_id: questions[5].id, statement: 'reboot a computer', correct: false }])
end

if Result.first.nil?
  Result.create!([{ user_id: users.first.id, test_id: tests.second.id, points: 2 },
                  { user_id: users.second.id, test_id: tests.first.id, points: 3 }])
end
