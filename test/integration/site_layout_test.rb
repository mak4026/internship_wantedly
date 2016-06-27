require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  include Warden::Test::Helpers

  def setup
    Warden.test_mode!
    @user = users( :john )
  end

  test "layout links not signed in" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path
    assert_select "a[href=?]", new_user_path
    assert_select "a[href=?]", new_me_session_path
  end

  test "layout links when signed in" do
  	log_in(@user)
  	get root_path
  	assert_template 'static_pages/home'
  	assert_select "a[href=?]", root_path
    assert_select "a[href=?]", user_path(@user)
    assert_select "a[href=?]", edit_me_path
    assert_select "a[href=?]", me_session_path
  end
end
