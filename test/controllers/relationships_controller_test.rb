require 'test_helper'

class RelationshipsControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  def setup
    @user = users( :john )
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Relationship.count' do
      post :create
    end
    assert_not flash.empty?
    assert_redirected_to new_me_session_path
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Relationship.count' do
      delete :destroy, id: relationships(:zero)
    end
    assert_not flash.empty?
    assert_redirected_to new_me_session_path
  end
end
