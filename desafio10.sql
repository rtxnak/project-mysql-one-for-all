SELECT 
  songs.song_name AS nome,
  count(reproduction_history.user_id) AS reproducoes
FROM SpotifyClone.songs_table AS songs

  INNER JOIN SpotifyClone.reproduction_history_table AS reproduction_history ON songs.song_id = reproduction_history.song_id
        
  INNER JOIN SpotifyClone.users_table AS users ON users.user_id = reproduction_history.user_id
        
  WHERE users.plan_id = 1 OR users.plan_id = 3
        
GROUP BY nome
ORDER BY count(reproduction_history.user_id) DESC, nome;
