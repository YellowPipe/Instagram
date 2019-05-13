require 'test_helper'

class ProfileDescriptionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @profile_description = profile_descriptions(:one)
  end

  test "should get index" do
    get profile_descriptions_url
    assert_response :success
  end

  test "should get new" do
    get new_profile_description_url
    assert_response :success
  end

  test "should create profile_description" do
    assert_difference('ProfileDescription.count') do
      post profile_descriptions_url, params: { profile_description: { body: @profile_description.body, name: @profile_description.name, user_id: @profile_description.user_id } }
    end

    assert_redirected_to profile_description_url(ProfileDescription.last)
  end

  test "should show profile_description" do
    get profile_description_url(@profile_description)
    assert_response :success
  end

  test "should get edit" do
    get edit_profile_description_url(@profile_description)
    assert_response :success
  end

  test "should update profile_description" do
    patch profile_description_url(@profile_description), params: { profile_description: { body: @profile_description.body, name: @profile_description.name, user_id: @profile_description.user_id } }
    assert_redirected_to profile_description_url(@profile_description)
  end

  test "should destroy profile_description" do
    assert_difference('ProfileDescription.count', -1) do
      delete profile_description_url(@profile_description)
    end

    assert_redirected_to profile_descriptions_url
  end
end
