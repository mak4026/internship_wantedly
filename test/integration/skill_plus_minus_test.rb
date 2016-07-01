require 'test_helper'

class SkillPlusMinusTest < ActionDispatch::IntegrationTest
  include Warden::Test::Helpers
  def setup
    Warden.test_mode!
    @user = users(:archer)
    @other = users(:john)
    @ruby = skills(:ruby)
    @java = skills(:java)
  end

  test "skill plus and minus" do
    log_in(@user)
    get user_path @other
    assert_match @ruby.name, response.body
    assert_match @java.name, response.body
    assert_difference 'Relationship.count', 1 do
      post relationships_path, {user_id: @other.id, skill_id: @ruby.id}
    end
    assert_redirected_to @other
    follow_redirect!
    assert_match @ruby.name, response.body
    assert_match @java.name, response.body
    assert_difference 'Relationship.count', -1 do
      delete relationship_path relationships(:three)
    end
    assert_redirected_to @other
  end

  test "can't another adder skill -1" do
    log_in(@user)
    assert_no_difference 'Relationship.count' do
      delete relationship_path relationships(:zero)
    end
  end

  test "can't +1 already +1ed skill" do
    log_in(@user)
    assert_no_difference 'Relationship.count' do
     post relationships_path, {user_id: @other.id, skill_id: @java.id}
    end
  end
end
