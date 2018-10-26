require "application_system_test_case"

class ScoreLogsTest < ApplicationSystemTestCase
  setup do
    @score_log = score_logs(:one)
  end

  test "visiting the index" do
    visit score_logs_url
    assert_selector "h1", text: "Score Logs"
  end

  test "creating a Score log" do
    visit score_logs_url
    click_on "New Score Log"

    fill_in "Comment", with: @score_log.comment
    fill_in "Name", with: @score_log.name
    fill_in "Published", with: @score_log.published
    fill_in "Score", with: @score_log.score
    click_on "Create Score log"

    assert_text "Score log was successfully created"
    click_on "Back"
  end

  test "updating a Score log" do
    visit score_logs_url
    click_on "Edit", match: :first

    fill_in "Comment", with: @score_log.comment
    fill_in "Name", with: @score_log.name
    fill_in "Published", with: @score_log.published
    fill_in "Score", with: @score_log.score
    click_on "Update Score log"

    assert_text "Score log was successfully updated"
    click_on "Back"
  end

  test "destroying a Score log" do
    visit score_logs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Score log was successfully destroyed"
  end
end
