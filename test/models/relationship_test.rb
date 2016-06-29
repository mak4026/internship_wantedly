require 'test_helper'

class RelationshipTest < ActiveSupport::TestCase
  def setup
    @relationship = Relationship.new(user_id: 1, adder_id: 2, skill_id: 1)
  end

  test "should be valid" do
  	assert @relationship.valid?
  end

  test "should require a user_id" do
    @relationship.user_id = nil
    assert_not @relationship.valid?
  end

  test "should require a adder_id" do
    @relationship.adder_id = nil
    assert_not @relationship.valid?
  end

  test "should require a skill_id" do
    @relationship.skill_id = nil
    assert_not @relationship.valid?
  end

end
