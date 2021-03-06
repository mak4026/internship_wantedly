require 'test_helper'

class SkillsControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  def setup
    @user = users( :john )
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Skill.count' do
      post :create
    end
    assert_not flash.empty?
    assert_redirected_to new_me_session_path
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Skill.count' do
      delete :destroy, id: skills(:cpp)
    end
    assert_not flash.empty?
    assert_redirected_to new_me_session_path
  end
end
