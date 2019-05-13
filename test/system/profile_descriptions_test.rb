require "application_system_test_case"

class ProfileDescriptionsTest < ApplicationSystemTestCase
  setup do
    @profile_description = profile_descriptions(:one)
  end

  test "visiting the index" do
    visit profile_descriptions_url
    assert_selector "h1", text: "Profile Descriptions"
  end

  test "creating a Profile description" do
    visit profile_descriptions_url
    click_on "New Profile Description"

    fill_in "Body", with: @profile_description.body
    fill_in "Name", with: @profile_description.name
    fill_in "User", with: @profile_description.user_id
    click_on "Create Profile description"

    assert_text "Profile description was successfully created"
    click_on "Back"
  end

  test "updating a Profile description" do
    visit profile_descriptions_url
    click_on "Edit", match: :first

    fill_in "Body", with: @profile_description.body
    fill_in "Name", with: @profile_description.name
    fill_in "User", with: @profile_description.user_id
    click_on "Update Profile description"

    assert_text "Profile description was successfully updated"
    click_on "Back"
  end

  test "destroying a Profile description" do
    visit profile_descriptions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Profile description was successfully destroyed"
  end
end
