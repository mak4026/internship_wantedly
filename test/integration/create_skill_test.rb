require 'test_helper'

class CreateSkillTest < ActionDispatch::IntegrationTest
  include Warden::Test::Helpers
  def setup
  	Warden.test_mode!
    @user = users(:archer)
    @other = users(:john)
    @java = skills(:java)
    @lisp = skills(:lisp)
    log_in(@user)
  end

  test "can't add an empty skill" do
    assert_no_difference 'Skill.count' do
      post skills_path, {skill: {name: "  "}, added_id: @other.id}
    end
  end

  test "add a new skill" do
    assert_difference 'Skill.count',1 do
      post skills_path, {skill: {name: "Mathematica"}, added_id: @other.id}
    end
  end

  test "Also add a relationship when add a new skill" do
    assert_difference 'Relationship.count',1 do
      post skills_path, {skill: {name: "Mathematica"}, added_id: @other.id}
    end
  end

  test "not register again already registered skill" do
    assert_no_difference 'Skill.count' do
      post skills_path, {skill: {name: @lisp.name}, added_id: @other.id}
    end
  end

  test "add a relationship already registered skill" do
    assert_difference 'Relationship.count',1 do
      post skills_path, {skill: {name: @lisp.name}, added_id: @other.id}
    end
  end

  test "can't +1 already +1ed skill" do
  	assert_no_difference 'Relationship.count' do
      post skills_path, {skill: {name: @java.name}, added_id: @other.id}
    end
  end
end
