select users.user_name as usuario,
if(max(year(reproduction_history.reproduction_timestamp)) >= 2021, 'Usuário ativo', 'Usuário inativo')as condicao_usuario
from SpotifyClone.users_table as users
inner join SpotifyClone.reproduction_history_table as reproduction_history on reproduction_history.user_id = users.user_id
group by users.user_name order by users.user_name;