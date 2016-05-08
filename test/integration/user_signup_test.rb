require 'test_helper'

class UserSignupTest < ActionDispatch::IntegrationTest
  
  test 'get new user signup form and redirect to user page if signup successful' do
    get signup_path
    assert_template 'users/new'
    assert_difference 'User.count', 1 do
      post_via_redirect users_path, user: {username: "TestUser", email: "testuser@example.com", password: "password"}
    end
    assert_template 'users/show'
  end
end
