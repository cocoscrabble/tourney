require "application_system_test_case"

class EntrantsTest < ApplicationSystemTestCase
  setup do
    @entrant = entrants(:one)
  end

  test "visiting the index" do
    visit entrants_url
    assert_selector "h1", text: "Entrants"
  end

  test "should create entrant" do
    visit entrants_url
    click_on "New entrant"

    fill_in "Division", with: @entrant.division
    fill_in "Name", with: @entrant.name
    fill_in "Player number", with: @entrant.player_number
    fill_in "Rating", with: @entrant.rating
    fill_in "Tournament", with: @entrant.tournament_id
    fill_in "Userid", with: @entrant.userid
    click_on "Create Entrant"

    assert_text "Entrant was successfully created"
    click_on "Back"
  end

  test "should update Entrant" do
    visit entrant_url(@entrant)
    click_on "Edit this entrant", match: :first

    fill_in "Division", with: @entrant.division
    fill_in "Name", with: @entrant.name
    fill_in "Player number", with: @entrant.player_number
    fill_in "Rating", with: @entrant.rating
    fill_in "Tournament", with: @entrant.tournament_id
    fill_in "Userid", with: @entrant.userid
    click_on "Update Entrant"

    assert_text "Entrant was successfully updated"
    click_on "Back"
  end

  test "should destroy Entrant" do
    visit entrant_url(@entrant)
    click_on "Destroy this entrant", match: :first

    assert_text "Entrant was successfully destroyed"
  end
end
