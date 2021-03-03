class BadgeService
  def initialize(test_passage)
    @test_passage = test_passage
  end

  def call
    Badge.all.each { |badge| @test_passage.user.badges << badge if call_check_method(badge) }
  end

  private

  def call_check_method(badge)
    name = 'check_' + badge.rule.title.gsub(' ', '_')
    @test_passage.successful? && send(name, badge)
  end

  def check_first_try(badge)
    badge.rule_argument == @test_passage.test.id &&
      @test_passage.user.tests.where(id: @test_passage.test.id).count == 1
  end

  def check_category_passage(badge)
    badge.rule_argument == @test_passage.test.category.id &&
      @test_passage.user.tests.where(category_id: badge.rule_argument).uniq.count ==
        Test.where(category_id: badge.rule_argument).count
  end

  def check_level_passage(badge)
    badge.rule_argument == @test_passage.test.level &&
      @test_passage.user.tests.where(level: badge.rule_argument).uniq.count ==
        Test.where(level: badge.rule_argument).count
  end
end
