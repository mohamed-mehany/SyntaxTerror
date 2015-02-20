require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  test "should get body:text" do
    get :body:text
    assert_response :success
  end

end
