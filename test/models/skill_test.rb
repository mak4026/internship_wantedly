require 'test_helper'

class SkillTest < ActiveSupport::TestCase
  def setup
    @skill = skills(:cpp)
  end
  test "should be valid?" do
    assert @skill.valid?
  end

  test "skill name should be present" do
  	@skill.name = nil
  	assert_not @skill.valid?
  end
end
