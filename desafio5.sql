select
	songs.song_name as cancao,
	count(reproduction_history.song_id) as reproducoes
from SpotifyClone.songs_table as songs
inner join SpotifyClone.reproduction_history_table as reproduction_history on reproduction_history.song_id = songs.song_id
group by reproduction_history.song_id
order by count(reproduction_history.song_id) desc, songs.song_name limit 2;