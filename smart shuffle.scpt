JsOsaDAS1.001.00bplist00�Vscript_var iTunes = Application("iTunes");
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
	
for (var i = 0; i < songs.length; i++) {
	var song = songs[i];
	song.duplicate({to:newPlaylist});
}
	
//songs.push(new iTunes.Track());


//get all the songs for that thing, put in an array
//length of array
//get lenghtOfArray random songs from good playlist
//while there are songs, alternate adding from each array into a new playlist                              ! jscr  ��ޭ