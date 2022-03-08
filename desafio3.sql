select
  users.user_name as usuario,
  count(reproduction_history.user_id) as qtde_musicas_ouvidas,
  round(sum(songs.song_length / 60), 2) as total_minutos
from SpotifyClone.users_table as users
inner join SpotifyClone.reproduction_history_table as reproduction_history on users.user_id = reproduction_history.user_id
inner join SpotifyClone.songs_table as songs on reproduction_history.song_id = songs.song_id
group by users.user_name order by users.user_name;
