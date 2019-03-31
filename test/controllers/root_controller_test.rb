require 'test_helper'

class RootControllerTest < ActionController::TestCase

  include Devise::Test::ControllerHelpers

  test "should get index" do
    @request.env['devise.mapping'] = Devise.mappings[:user]
    sign_in users(:john)

    get :index
    assert_response :success
  end

end
