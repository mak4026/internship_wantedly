require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  def setup
    @user = users( :john )
    log_in(@user)
  end

  test "should get home" do
    get :home
    assert_response :success
    assert_select "title", "インターンシップ課題プログラム"
  end

end
