var iTunes = Application("iTunes");
var library = iTunes.playlists["Library"];
var sourcePlaylistName = "random helper";
var searchText = "Hayley";
var searchSpot = "artists";

var songs = iTunes.search(library, {
	for: searchText, 
	only: searchSpot
});
	
//TODO: check for that playlist first, if there is just update it
var playlistName = "smart " + searchText
var newPlaylist = iTunes.UserPlaylist().make();
newPlaylist.name = playlistName;

var numSongs = songs.length;

//get "random" songs from a good playlist
var randomPlaylist = iTunes.playlists[sourcePlaylistName];
var randomSongs = randomPlaylist.tracks;

var random = false;
var i = 0;
while (i < numSongs) {
	var song;
	if (random) {
		song = randomSongs[i];
		random = false;
		i++;
	} else {
		song = songs[i];
		random = true;
	}
	song.duplicate({to:newPlaylist});
}