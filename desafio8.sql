SELECT 
	artist.artist_name AS artista,
	album.album_name AS album
FROM SpotifyClone.artist_table AS artist

INNER JOIN SpotifyClone.album_table AS album ON artist.artist_id = album.artist_id
    
WHERE artist_name = 'Walter Phoenix';