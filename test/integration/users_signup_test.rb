require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: {name: "",
                                 email: "user@invalid",
                                 password: "foo",
                                 password_confirmation: "bar"} }
    end
    assert_template 'users/new'
  end

  test "valid singup information" do
    get signup_path
    assert_difference 'User.count',1 do
      post users_path, params: { user: { name: "Exmaple",
                                         email: "User@example.com",
                                         password: "password",
                                         password: "password"} }
    end
    follow_redirect!
    assert_template 'users/show'
    assert_not flash.nil?
  end

end
