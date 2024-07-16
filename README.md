# Video Playlist App

This application is a simple video playlist manager built with Ruby on Rails and integrated with a mock YouTube API. It allows users to fetch a list of YouTube videos, display them, create playlists, add videos to playlists, and remove videos from playlists. The application is styled using Bootstrap.

## Prerequisites

Before you begin, ensure you have met the following requirements:

- Docker
- Docker Compose

## Getting Started

```bash
git clone https://github.com/your-username/video-playlist-app.git
cd video-playlist-app
docker-compose up --build
docker-compose exec web rails db:create db:migrate db:seed

```

http://localhost:3000


## Usage
### Fetching and Displaying Videos
The application fetches a list of YouTube videos from a mock API and displays them on the homepage. You can search for videos by title using the search bar.

### Managing Playlists
You can create new playlists and manage existing ones.

- Create a Playlist: Navigate to the "Playlists" page and click "New Playlist" to create a new playlist.
- Add Videos to Playlist: Open a video from the homepage, and use the "Add to Playlist" dropdown in the video modal to add the video to a playlist.
- Remove Videos from Playlist: In the playlist view, you can remove videos from the playlist by clicking the "x" button next to each video.


## Project Structure
- `app/javascript/packs/application.js`: Main JavaScript entry point.
- `app/javascript/packs/stylesheets/application.scss`: Main stylesheet entry point.
- `app/controllers/videos_controller.rb`: Controller for handling video-related actions.
- `app/controllers/playlists_controller.rb`: Controller for handling playlist-related actions.
- `app/models/video.rb`: Video model.
- `app/models/playlist.rb`: Playlist model.
- `app/models/playlist_video.rb`: Join model for videos and playlists.
- `config/webpack/environment.js`: Webpack configuration.