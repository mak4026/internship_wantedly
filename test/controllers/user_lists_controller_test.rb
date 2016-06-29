require 'test_helper'

class UserListsControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  def setup
    @user = users( :john )
  end

  test "should redirect index when not logged in" do
    get :index
    assert_not flash.empty?
    assert_redirected_to new_me_session_path
  end

  test "should redirect show when not logged in" do
  	get :show, id: @user
    assert_not flash.empty?
    assert_redirected_to new_me_session_path
  end

end
