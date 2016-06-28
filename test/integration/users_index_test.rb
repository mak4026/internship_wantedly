require 'test_helper'

class UsersIndexTest < ActionDispatch::IntegrationTest
  include Warden::Test::Helpers
  def setup
    Warden.test_mode!
    @user = users( :john )
  end

 test "index including pagination" do
    log_in(@user)
    get users_path
    assert_template 'users/index'
    assert_select 'div.pagination'
    User.paginate(page: 1).each do |user|
      assert_select 'a[href=?]', user_path(user), text: user.name
    end
  end

end
