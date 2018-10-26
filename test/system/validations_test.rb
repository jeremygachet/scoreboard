require "application_system_test_case"

class ValidationsTest < ApplicationSystemTestCase
  setup do
    @validation = validations(:one)
  end

  test "visiting the index" do
    visit validations_url
    assert_selector "h1", text: "Validations"
  end

  test "creating a Validation" do
    visit validations_url
    click_on "New Validation"

    fill_in "Exo", with: @validation.exo
    fill_in "Team", with: @validation.team
    click_on "Create Validation"

    assert_text "Validation was successfully created"
    click_on "Back"
  end

  test "updating a Validation" do
    visit validations_url
    click_on "Edit", match: :first

    fill_in "Exo", with: @validation.exo
    fill_in "Team", with: @validation.team
    click_on "Update Validation"

    assert_text "Validation was successfully updated"
    click_on "Back"
  end

  test "destroying a Validation" do
    visit validations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Validation was successfully destroyed"
  end
end
