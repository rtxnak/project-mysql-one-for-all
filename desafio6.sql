SELECT 
	min(plan.plan_price) AS faturamento_minimo,
	max(plan.plan_price) AS faturamento_maximo,
	round(avg(plan.plan_price), 2) AS faturamento_medio,
	sum(plan.plan_price) AS faturamento_total
    
  FROM SpotifyClone.plan_table AS plan
    
  INNER JOIN SpotifyClone.users_table AS users ON plan.plan_id = users.plan_id;