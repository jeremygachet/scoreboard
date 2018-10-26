require 'test_helper'

class ScoreLogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @score_log = score_logs(:one)
  end

  test "should get index" do
    get score_logs_url
    assert_response :success
  end

  test "should get new" do
    get new_score_log_url
    assert_response :success
  end

  test "should create score_log" do
    assert_difference('ScoreLog.count') do
      post score_logs_url, params: { score_log: { comment: @score_log.comment, name: @score_log.name, published: @score_log.published, score: @score_log.score } }
    end

    assert_redirected_to score_log_url(ScoreLog.last)
  end

  test "should show score_log" do
    get score_log_url(@score_log)
    assert_response :success
  end

  test "should get edit" do
    get edit_score_log_url(@score_log)
    assert_response :success
  end

  test "should update score_log" do
    patch score_log_url(@score_log), params: { score_log: { comment: @score_log.comment, name: @score_log.name, published: @score_log.published, score: @score_log.score } }
    assert_redirected_to score_log_url(@score_log)
  end

  test "should destroy score_log" do
    assert_difference('ScoreLog.count', -1) do
      delete score_log_url(@score_log)
    end

    assert_redirected_to score_logs_url
  end
end
