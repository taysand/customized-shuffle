JsOsaDAS1.001.00bplist00�Vscript_Cvar iTunes = Application("iTunes");
var library = iTunes.playlists["Library"];

//get this from user
var searchText = "Banks";

//get this from user
var searchSpot = "artists";

var songs = iTunes.search(library, {
	for: searchText, 
	only: searchSpot
});
	
//check for that playlist first, if there is just update it
var playlistName = "smart " + searchText
var newPlaylist = iTunes.UserPlaylist().make();
newPlaylist.name = playlistName;

var numSongs = songs.length;
//get numSongs random songs from good playlist
var randomSongs = iTunes.search(library, {
	for: "Fall", 
	only: searchSpot
});

//songs.push(track);

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
}                              Y jscr  ��ޭ