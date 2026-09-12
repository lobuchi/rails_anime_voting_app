require "application_system_test_case"

class AnimesTest < ApplicationSystemTestCase
  setup do
    @anime = animes(:one)
    @user = users(:one)
  end

  test "visiting the index" do
    visit animes_url
    assert_selector "h1", text: "Anime Leaderboard"
  end

  test "should create anime" do
    sign_in_as(@user)
    visit animes_url
    click_on "New anime"

    fill_in "Description", with: @anime.description
    fill_in "Title", with: @anime.title
    click_on "Create Anime"

    assert_text "Anime was successfully created"
    click_on "Back"
  end

  test "should update Anime" do
    sign_in_as(@user)
    visit anime_url(@anime)
    click_on "Edit this anime", match: :first

    fill_in "Description", with: @anime.description
    fill_in "Title", with: @anime.title
    click_on "Update Anime"

    assert_text "Anime was successfully updated"
    click_on "Back"
  end

  test "should destroy Anime" do
    sign_in_as(@user)
    visit anime_url(@anime)
    click_on "Destroy this anime", match: :first

    assert_text "Anime was successfully destroyed"
  end
end
