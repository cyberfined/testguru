class TestPassage < ApplicationRecord
  MINIMUM_PROGRESS = 0.85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_update :before_save_set_next_question, unless: :completed?

  def completed?
    current_question.nil?
  end

  def force_complete!
    self.current_question = nil
    save
  end

  def successful?
    completed? and points / num_questions >= MINIMUM_PROGRESS
  end

  def submit_answer!(answer_ids)
    if correct_answer?(answer_ids)
      self.points += 1
    end

    save
  end

  def current_question_number
    test.questions.index(current_question) + 1
  end

  def num_questions
    test.questions.count
  end

  def time_left
    time_limit = test.timer || 0
    time_limit * 60 - (Time.now - created_at).to_i
  end

  def time_over?
    test.timer.present? && time_left <= 0
  end

  private

  def before_save_set_next_question
    self.current_question = test.questions.where('id > ?', current_question.id).first
  end

  def correct_answer?(answer_ids)
    return false unless answer_ids.kind_of?(Array)
    current_question.answers.correct.ids.sort == answer_ids.map(&:to_i).sort
  end

  def before_validation_set_first_question
    self.current_question = test.questions.first
  end
end
