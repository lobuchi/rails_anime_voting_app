require "test_helper"

class AnimesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @anime = animes(:one)
    @user = users(:one)
  end

  test "should get index" do
    get animes_url
    assert_response :success
  end

  test "should get new" do
    sign_in_as(@user)
    get new_anime_url
    assert_response :success
  end

  test "should create anime" do
    sign_in_as(@user)

    assert_difference("Anime.count") do
      post animes_url, params: { anime: { description: @anime.description, title: @anime.title } }
    end

    assert_redirected_to anime_url(Anime.last)
  end

  test "should show anime" do
    get anime_url(@anime)
    assert_response :success
  end

  test "should get edit" do
    sign_in_as(@user)
    get edit_anime_url(@anime)
    assert_response :success
  end

  test "should update anime" do
    sign_in_as(@user)
    patch anime_url(@anime), params: { anime: { description: @anime.description, title: @anime.title } }
    assert_redirected_to anime_url(@anime)
  end

  test "should destroy anime" do
    sign_in_as(@user)

    assert_difference("Anime.count", -1) do
      delete anime_url(@anime)
    end

    assert_redirected_to animes_url
  end
end
