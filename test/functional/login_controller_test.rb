require 'test_helper'

class LoginControllerTest < ActionController::TestCase
  
  test "Should test logging in with correct credintial" do
   post :complete, {"username" => AdminUsers::LOGIN[:username], "password" => AdminUsers::LOGIN[:password] }
   assert_response :redirect	
  end

  test "Should test logging in with incorrect credintial" do
   post :complete, {"username" => "Badusername", "password" => "passaos" }
   assert_response :success
  end


end