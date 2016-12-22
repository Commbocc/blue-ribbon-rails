require 'test_helper'

class ChildFatalitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @child_fatality = child_fatalities(:one)
  end

  test "should get index" do
    get child_fatalities_url
    assert_response :success
  end

  test "should get new" do
    get new_child_fatality_url
    assert_response :success
  end

  test "should create child_fatality" do
    assert_difference('ChildFatality.count') do
      post child_fatalities_url, params: { child_fatality: { age: @child_fatality.age, causal: @child_fatality.causal, county: @child_fatality.county, dod: @child_fatality.dod, gender: @child_fatality.gender, narrative: @child_fatality.narrative, priorChild: @child_fatality.priorChild, priorFive: @child_fatality.priorFive, priorFiveServices: @child_fatality.priorFiveServices, priorTwelve: @child_fatality.priorTwelve, priorVerChild: @child_fatality.priorVerChild } }
    end

    assert_redirected_to child_fatality_url(ChildFatality.last)
  end

  test "should show child_fatality" do
    get child_fatality_url(@child_fatality)
    assert_response :success
  end

  test "should get edit" do
    get edit_child_fatality_url(@child_fatality)
    assert_response :success
  end

  test "should update child_fatality" do
    patch child_fatality_url(@child_fatality), params: { child_fatality: { age: @child_fatality.age, causal: @child_fatality.causal, county: @child_fatality.county, dod: @child_fatality.dod, gender: @child_fatality.gender, narrative: @child_fatality.narrative, priorChild: @child_fatality.priorChild, priorFive: @child_fatality.priorFive, priorFiveServices: @child_fatality.priorFiveServices, priorTwelve: @child_fatality.priorTwelve, priorVerChild: @child_fatality.priorVerChild } }
    assert_redirected_to child_fatality_url(@child_fatality)
  end

  test "should destroy child_fatality" do
    assert_difference('ChildFatality.count', -1) do
      delete child_fatality_url(@child_fatality)
    end

    assert_redirected_to child_fatalities_url
  end
end
