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

  test "relationship should be destroyed" do
    john = users(:john)
    archer = users(:archer)
    archer.plus_one(john, @skill)
    assert_difference 'Relationship.count', -1 do
      @skill.destroy
    end
  end
end
