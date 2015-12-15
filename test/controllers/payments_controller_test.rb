require 'test_helper'

class PaymentsControllerTest < ActionController::TestCase

  test "should create alert" do
      post :create

      assert_equal(response.body, "OK")
  end
end
