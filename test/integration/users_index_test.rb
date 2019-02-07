require 'test_helper'

class UsersIndexTest < ActionDispatch::IntegrationTest

  def setup
    @admin    = users(:michael)
    @non_admin = users(:archer)
  end

  test "index as admin including pagination of activated users and delete links" do
    log_in_as(@admin)
    get users_path
    assert_select 'div.pagination'
    users = assigns(:users)
    pages = users.total_pages
    (0..pages).each do |page|
      get users_path(page: page + 1)
      users = assigns(:users)
      users.each do |user|
        assert_equal user.activated?, true
        assert_select 'a[href=?]', user_path(user), text: user.name
        unless user == @admin
          assert_select 'a[href=?]', user_path(user), text: 'delete'
        end
      end
    end
    assert_difference 'User.count', -1 do
      delete user_path(@non_admin)
    end
  end

  test "index as non-admin" do
    log_in_as(@non_admin)
    get users_path
    assert_select 'a', text: 'delete', count: 0
  end

end
