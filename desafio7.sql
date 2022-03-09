SELECT 	
	artist.artist_name AS artista,
    album.album_name AS album,
    count(following_artists.user_id) AS seguidores
    
FROM SpotifyClone.album_table AS album

INNER JOIN SpotifyClone.artist_table AS artist
	ON album.artist_id = artist.artist_id
    
INNER JOIN SpotifyClone.following_artists_table AS following_artists
	ON following_artists.artist_id = album.artist_id
    
GROUP BY artista, album 
ORDER BY seguidores DESC, artista , album ;