require "test_helper"

class EntrantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @entrant = entrants(:one)
  end

  test "should get index" do
    get entrants_url
    assert_response :success
  end

  test "should get new" do
    get new_entrant_url
    assert_response :success
  end

  test "should create entrant" do
    assert_difference("Entrant.count") do
      post entrants_url, params: { entrant: { division: @entrant.division, name: @entrant.name, player_number: @entrant.player_number, rating: @entrant.rating, tournament_id: @entrant.tournament_id, userid: @entrant.userid } }
    end

    assert_redirected_to entrant_url(Entrant.last)
  end

  test "should show entrant" do
    get entrant_url(@entrant)
    assert_response :success
  end

  test "should get edit" do
    get edit_entrant_url(@entrant)
    assert_response :success
  end

  test "should update entrant" do
    patch entrant_url(@entrant), params: { entrant: { division: @entrant.division, name: @entrant.name, player_number: @entrant.player_number, rating: @entrant.rating, tournament_id: @entrant.tournament_id, userid: @entrant.userid } }
    assert_redirected_to entrant_url(@entrant)
  end

  test "should destroy entrant" do
    assert_difference("Entrant.count", -1) do
      delete entrant_url(@entrant)
    end

    assert_redirected_to entrants_url
  end
end
