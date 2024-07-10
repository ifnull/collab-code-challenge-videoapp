require "test_helper"

class PlaylistsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get playlists_create_url
    assert_response :success
  end

  test "should get show" do
    get playlists_show_url
    assert_response :success
  end

  test "should get add_video" do
    get playlists_add_video_url
    assert_response :success
  end

  test "should get remove_video" do
    get playlists_remove_video_url
    assert_response :success
  end
end
