require 'test_helper'

class HomeControllerTest < ActionController::TestCase

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should fill in correct location" do
  	get :index
  	assert_select 'h1', "Welcome to Kate's LastFM!"
  end

end