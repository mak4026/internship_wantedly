require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Example User", email: "user@example.com",
                     password: "hogehoge", password_confirmation: "hogehoge")
  end

  test "should be valid" do
  	assert @user.valid?
  end

  test "name should be present" do
    @user.name = "     "
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = "     "
    assert_not @user.valid?
  end

  test "name should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test "email addresses should be unique" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end

  test "password confirmation" do
  	@user.password_confirmation = "fugafuga"
  	assert_not @user.valid?
  end

  test "should add skill, check having skill?" do
    john = users(:john)
    archer = users(:archer)
    cpp = skills(:cpp)
    assert_not john.skill_having?(cpp)
    archer.plus_one(john, cpp)
    assert john.skill_having?(cpp)
    john.delete_skill(cpp)
    assert_not john.skill_having?(cpp)
  end

  test "たくさん+1されたスキルを削除する" do
    john = users(:john)
    archer = users(:archer)
    lana = users(:lana)
    cpp = skills(:cpp)
    assert_not john.skill_having?(cpp)
    archer.plus_one(john, cpp)
    lana.plus_one(john,cpp)
    assert john.skill_having?(cpp)
    john.delete_skill(cpp)
    assert_not john.skill_having?(cpp)
  end

  test "has_skill should be destroyed" do
    lana = users(:lana)
    assert_difference 'Relationship.count', -1 do
      lana.destroy
    end
  end

  test "has_skill & add_skill should be destroyed" do
    john = users(:john)
    assert_difference 'Relationship.count', -5 do
      john.destroy
    end
  end

  test "skill list correct?" do
    john = users(:john)
    archer = users(:archer)
    java = skills(:java)
    ruby = skills(:ruby)
    assert_equal java, john.skills_list[0].first
    assert_equal ruby, john.skills_list[0].second
    assert_equal 2, john.skills_list[1][java.id]
    assert_equal 1, john.skills_list[1][ruby.id]
  end
end
