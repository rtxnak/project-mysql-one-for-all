SELECT
	song_name AS nome_musica,
     CASE
        WHEN song_name = "Without My Streets" THEN "Without My Code Review"
		    WHEN song_name = "Dance With Her Own" THEN "Dance With Trybe"
        WHEN song_name = "Troubles Of My Inner Fire" THEN "Troubles Of My Project"
        WHEN song_name = "Let's Be Silly" THEN "Let's Be Nice"
        WHEN song_name = "Magic Circus" THEN "Magic Pull Request"
	    END AS novo_nome FROM SpotifyClone.songs_table
	
  HAVING novo_nome IS NOT NULL
  ORDER BY nome_musica;