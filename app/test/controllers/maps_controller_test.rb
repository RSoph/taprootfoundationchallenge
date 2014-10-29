require 'test_helper'

class MapsControllerTest < ActionController::TestCase

  test "should get index" do
		get(:index, {'user_location' => "new york"})
	  assert_response :success
    assert_not_nil assigns(:location)
  end

  test "should display location" do
		get(:index, {'user_location' => "new york"})
  	assert_select 'p', "Check out the events happening in new york!"
  end

end
