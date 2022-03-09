SELECT 
	count(reproduction_history.user_id) AS quantidade_musicas_no_historico
    
FROM SpotifyClone.reproduction_history_table AS reproduction_history
    
INNER JOIN SpotifyClone.users_table AS users ON reproduction_history.user_id = users.user_id
    
 WHERE users.user_name = 'Bill';