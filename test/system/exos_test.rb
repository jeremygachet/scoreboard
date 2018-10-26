require "application_system_test_case"

class ExosTest < ApplicationSystemTestCase
  setup do
    @exo = exos(:one)
  end

  test "visiting the index" do
    visit exos_url
    assert_selector "h1", text: "Exos"
  end

  test "creating a Exo" do
    visit exos_url
    click_on "New Exo"

    fill_in "Comment", with: @exo.comment
    fill_in "Name", with: @exo.name
    fill_in "Points", with: @exo.points
    fill_in "Position", with: @exo.position
    click_on "Create Exo"

    assert_text "Exo was successfully created"
    click_on "Back"
  end

  test "updating a Exo" do
    visit exos_url
    click_on "Edit", match: :first

    fill_in "Comment", with: @exo.comment
    fill_in "Name", with: @exo.name
    fill_in "Points", with: @exo.points
    fill_in "Position", with: @exo.position
    click_on "Update Exo"

    assert_text "Exo was successfully updated"
    click_on "Back"
  end

  test "destroying a Exo" do
    visit exos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Exo was successfully destroyed"
  end
end
