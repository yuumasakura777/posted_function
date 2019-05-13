require 'test_helper'

class ImgpostsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get imgposts_new_url
    assert_response :success
  end

end
