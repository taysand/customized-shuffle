var iTunes = Application("iTunes");
var library = iTunes.playlists["Library"];
var sourcePlaylistName = "random helper";
var searchText = "bastille";
var searchSpot = "artists";

var songs = iTunes.search(library, {
	for: searchText, 
	only: searchSpot
});
var numSongs = songs.length;
	
//TODO: check for that playlist first, if it exists just update it
//create new playlist
var playlistName = "smart " + searchText
var newPlaylist = iTunes.UserPlaylist().make();
newPlaylist.name = playlistName;

//get random songs from a good playlist and alternate
var randomSongs = iTunes.playlists[sourcePlaylistName].tracks;
var random = false;
var i = 0;
while (i < numSongs) {
	var song;
	if (random) {
		song = randomSongs[Math.floor(Math.random() * randomSongs.length)];
		random = false;
		i++;
	} else {
		song = songs[i];
		random = true;
	}
	song.duplicate({to:newPlaylist});
}