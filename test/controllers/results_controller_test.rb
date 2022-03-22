require "test_helper"

class ResultsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @result = results(:one)
  end

  test "should get index" do
    get results_url
    assert_response :success
  end

  test "should get new" do
    get new_result_url
    assert_response :success
  end

  test "should create result" do
    assert_difference("Result.count") do
      post results_url, params: { result: { division: @result.division, entrant_id: @result.entrant_id, first: @result.first, opponent_id: @result.opponent_id, opponent_score: @result.opponent_score, round: @result.round, score: @result.score, tournament_id: @result.tournament_id } }
    end

    assert_redirected_to result_url(Result.last)
  end

  test "should show result" do
    get result_url(@result)
    assert_response :success
  end

  test "should get edit" do
    get edit_result_url(@result)
    assert_response :success
  end

  test "should update result" do
    patch result_url(@result), params: { result: { division: @result.division, entrant_id: @result.entrant_id, first: @result.first, opponent_id: @result.opponent_id, opponent_score: @result.opponent_score, round: @result.round, score: @result.score, tournament_id: @result.tournament_id } }
    assert_redirected_to result_url(@result)
  end

  test "should destroy result" do
    assert_difference("Result.count", -1) do
      delete result_url(@result)
    end

    assert_redirected_to results_url
  end
end
