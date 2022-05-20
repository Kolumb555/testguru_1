class AwardGiveService

  def initialize(test_passage)
    @user = test_passage.user
    @test = test_passage.test
    @test_passage = test_passage
  end

  def call
    Badge.all.each do |badge|
      if self.send("#{badge.rule}_rule", (badge.rule_option))
        add_badge_to_user(badge)
      end
    end
  end

  def add_badge_to_user(badge)
    @user.badges << badge
  end

  def category_rule(category_id)
    tests_ids = Test.where(category_id: category_id, public: true).ids.uniq.sort
    passed_tests_ids = @user.test_passages.where(passed: true).pluck(:test_id).uniq.sort
    tests_ids == passed_tests_ids
  end

  def first_try_rule(params)
    @test_passage.test_passed? && @user.tests.where(id: @test.id).count == 1
  end

  def level_rule(level)
    tests_ids = Test.where(level: level, public: true).ids.uniq.sort
    passed_tests_ids = @user.test_passages.where(passed: true, test_id: tests_ids).pluck(:test_id).uniq.sort
    tests_ids == passed_tests_ids
  end
end