require "application_system_test_case"

class ResultsTest < ApplicationSystemTestCase
  setup do
    @result = results(:one)
  end

  test "visiting the index" do
    visit results_url
    assert_selector "h1", text: "Results"
  end

  test "should create result" do
    visit results_url
    click_on "New result"

    fill_in "Division", with: @result.division
    fill_in "Entrant", with: @result.entrant_id
    check "First" if @result.first
    fill_in "Opponent", with: @result.opponent_id
    fill_in "Opponent score", with: @result.opponent_score
    fill_in "Round", with: @result.round
    fill_in "Score", with: @result.score
    fill_in "Tournament", with: @result.tournament_id
    click_on "Create Result"

    assert_text "Result was successfully created"
    click_on "Back"
  end

  test "should update Result" do
    visit result_url(@result)
    click_on "Edit this result", match: :first

    fill_in "Division", with: @result.division
    fill_in "Entrant", with: @result.entrant_id
    check "First" if @result.first
    fill_in "Opponent", with: @result.opponent_id
    fill_in "Opponent score", with: @result.opponent_score
    fill_in "Round", with: @result.round
    fill_in "Score", with: @result.score
    fill_in "Tournament", with: @result.tournament_id
    click_on "Update Result"

    assert_text "Result was successfully updated"
    click_on "Back"
  end

  test "should destroy Result" do
    visit result_url(@result)
    click_on "Destroy this result", match: :first

    assert_text "Result was successfully destroyed"
  end
end
