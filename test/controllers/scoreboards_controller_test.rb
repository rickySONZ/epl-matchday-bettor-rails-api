require "test_helper"

class ScoreboardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @scoreboard = scoreboards(:one)
  end

  test "should get index" do
    get scoreboards_url, as: :json
    assert_response :success
  end

  test "should create scoreboard" do
    assert_difference('Scoreboard.count') do
      post scoreboards_url, params: { scoreboard: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show scoreboard" do
    get scoreboard_url(@scoreboard), as: :json
    assert_response :success
  end

  test "should update scoreboard" do
    patch scoreboard_url(@scoreboard), params: { scoreboard: {  } }, as: :json
    assert_response 200
  end

  test "should destroy scoreboard" do
    assert_difference('Scoreboard.count', -1) do
      delete scoreboard_url(@scoreboard), as: :json
    end

    assert_response 204
  end
end
