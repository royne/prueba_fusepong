require 'test_helper'

class AsignationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get asignations_new_url
    assert_response :success
  end

end
