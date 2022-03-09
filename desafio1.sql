DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

create table SpotifyClone.plan_table(
  plan_id integer primary key auto_increment,
  plan_name varchar(50) not null,
  plan_price decimal(5,2) not null
) engine = innodb;

create table SpotifyClone.users_table(
  user_id integer primary key auto_increment,
  user_name varchar(50) not null,
  user_age integer not null,
  user_subscription_date DATE not null,
  plan_id integer not null,
  foreign key (plan_id) references plan_table (plan_id)
) engine = innodb;

create table SpotifyClone.artist_table(
  artist_id integer primary key auto_increment,
  artist_name varchar(50) not null
) engine = innodb;

create table SpotifyClone.album_table(
  album_id integer primary key auto_increment,
  album_name varchar(100) not null,
  release_year year not null,
  artist_id integer not null,
  foreign key (artist_id) references artist_table (artist_id)
) engine = innodb;

create table SpotifyClone.songs_table(
	song_id integer primary key auto_increment,
  song_name varchar(100) not null,
  song_length integer not null,
  album_id integer not null,
  foreign key (album_id) references album_table (album_id),
  artist_id integer not null,
  foreign key (artist_id) references artist_table (artist_id)
) engine = innodb;

create table SpotifyClone.following_artists_table(
  user_id integer not null,
  artist_id integer not null,
  primary key (user_id, artist_id),
  foreign key (user_id) references users_table (user_id),
  foreign key (artist_id) references artist_table (artist_id)
) engine = innodb;

create table SpotifyClone.reproduction_history_table(
  user_id integer not null,
  song_id integer not null,
  reproduction_timestamp TIMESTAMP not null,
  primary key (user_id, song_id),
  foreign key (user_id) references users_table (user_id),
  foreign key (song_id) references songs_table (song_id)
) engine = innodb;

insert into SpotifyClone.plan_table (plan_name, plan_price)
values
  ("gratuito", 0),
  ("universitário", 5.99),
  ("pessoal", 6.99),
  ("familiar", 7.99);

insert into SpotifyClone.users_table (user_name, user_age, user_subscription_date, plan_id)
values
  ('Thati', 23, '2019-10-20', 1),
  ('Cintia', 35, '2017-12-30', 4),
  ('Bill', 20, '2019-06-05', 2),
  ('Roger', 45, '2020-05-13', 3),
  ('Norman', 58, '2017-02-17', 3),
  ('Patrick', 33, '2017-01-06', 4),
  ('Vivian', 26, '2018-01-05', 2),
  ('Carol', 19, '2018-02-14', 2),
  ('Angelina', 42, '2018-04-29', 4),
  ('Paul', 46, '2017-01-17', 4);

insert into SpotifyClone.artist_table (artist_name)
values
	  ('Walter Phoenix'),
    ('Peter Strong'),
    ('Lance Day'),
    ('Freedie Shannon'),
    ('Tyler Isle'),
    ('Fog');

insert into SpotifyClone.album_table (album_name, artist_id,release_year )
values
	  ('Envious', 1, 1990),
    ('Exuberant', 1, 1993),
    ('Hallowed Steam', 2, 1995),
    ('Incandescent', 3, 1998),
    ('Temporary Culture', 4, 2001),
    ('Library of liberty', 4, 2003),
    ('Chained Down', 5, 2007),
    ('Cabinet of fools', 5, 2012),
    ('No guarantees', 5, 2015),
    ('Apparatus', 6, 2015);

insert into SpotifyClone.songs_table (song_name, artist_id, album_id, song_length )
values
	  ('Soul For Us', 1, 1, 200),
    ('Reflections Of Magic', 1, 1, 163),
    ('Dance With Her Own', 1, 1, 116),
    ('Troubles Of My Inner Fire', 1, 2, 203),
    ('Time Fireworks', 1,	2,	152),
    ('Magic Circus', 2,	3,	105),
    ('Honey, So Do I', 2,	3,	207),
    ("Sweetie, Let's Go Wild", 2,	3,	139),
    ('She Knows', 2,	3,	244),
    ('Fantasy For Me', 3,	4,	100),
	  ('Celebration Of More', 3,	4,	146),
    ('Rock His Everything', 3,	4,	223),
    ('Home Forever', 3,	4,	231),
    ('Diamond Power', 3,	4,	241),
    ("Let's Be Silly", 3,	4,	132),
    ('Thang Of Thunder', 4,	5,	240),
    ('Words Of Her Life', 4,	5,	185),
    ('Without My Streets', 4,	5,	176),
    ('Need Of The Evening', 4,	6,	190),
    ('History Of My Roses', 4,	6,	222),
    ('Without My Love', 4,	6,	111),
    ('Walking And Game', 4,	6,	123),
    ('Young And Father', 4,	6,	197),
    ('Finding My Traditions', 5, 7,	179),
    ('Walking And Man', 5,	7,	229),
    ('Hard And Time', 5,	7,	135),
    ("Honey, I'm A Lone Wolf", 5,	7,	150),
    ("She Thinks I Won't Stay Tonight", 5, 	8,	166),
    ("He Heard You're Bad For Me", 5,	8,	154),
    ("He Hopes We Can't Stay", 5, 	8,	210),
    ("I Know I Know", 5, 8,	117),
    ("He's Walking Away", 5, 9,	159),
    ("He's Trouble", 5,	9,	138),
    ("I Heard I Want To Bo Alone", 5, 9,	120),
    ("I Ride Alone", 5,	9, 151),
    ("Honey", 6, 10,	79),
    ("You Cheated On Me", 6, 10,	95),
    ("Wouldn't It Be Nice", 6, 10,	213),
    ("Baby", 6,	10,	136),
    ("You Make Me Feel So..", 6, 10, 83);

insert into SpotifyClone.following_artists_table (user_id, artist_id)
values
	  (1,	1),
    (1,	4),
    (1,	3),
    (2,	1),
    (2,	3),
    (3,	2),
    (3,	1),
    (4,	4),
    (5,	5),
    (5,	6),
    (6,	6),
    (6,	3),
    (6,	1),
    (7,	2),
    (7,	5),
    (8,	1),
    (8,	5),
    (9,	6),
    (9,	4),
    (9,	3),
    (10, 2),
    (10, 6);

insert into SpotifyClone.reproduction_history_table (user_id, song_id, reproduction_timestamp)
values
	(1,	36,	'2020-02-28 10:45:55'),
	(1,	25,	'2020-05-02 05:30:35'),
	(1,	23,	'2020-03-06 11:22:33'),
	(1,	14,	'2020-08-05 08:05:17'),
	(1,	15,	'2020-09-14 16:32:22'), 
	(2,	34,	'2020-01-02 07:40:33'), 
	(2,	24,	'2020-05-16 06:16:22'), 
	(2,	21,	'2020-10-09 12:27:48'), 
	(2,	39,	'2020-09-21 13:14:46'), 
	(3,	6,	'2020-11-13 16:55:13'), 
	(3,	3,	'2020-12-05 18:38:30'), 
	(3,	26,	'2020-07-30 10:00:00'), 
	(4,	2,	'2021-08-15 17:10:10'), 
	(4,	35,	'2021-07-10 15:20:30'), 
	(4,	27,	'2021-01-09 01:44:33'), 
	(5,	7,	'2020-07-03 19:33:28'), 
	(5,	12,	'2017-02-24 21:14:22'), 
	(5,	14,	'2020-08-06 15:23:43'), 
	(5,	1,	'2020-11-10 13:52:27'),
	(6,	38,	'2019-02-07 20:33:48'),
	(6,	29,	'2017-01-24 00:31:17'),
	(6,	30,	'2017-10-12 12:35:20'),
	(6,	22,	'2018-05-29 14:56:41'),
	(7,	5,	'2018-05-09 22:30:49'),
	(7,	4,	'2020-07-27 12:52:58'),
	(7,	11,	'2018-01-16 18:40:43'),
	(8,	39,	'2018-03-21 16:56:40'),
	(8,	40,	'2020-10-18 13:38:05'),
	(8,	32,	'2019-05-25 08:14:03'),
	(8,	33,	'2021-08-15 21:37:09'),
	(9,	16,	'2021-05-24 17:23:45'),
	(9,	17,	'2018-12-07 22:48:52'),
	(9,	8,	'2021-03-14 06:14:26'),
	(9,	9,	'2020-04-01 03:36:00'),
	(10, 20, '2017-02-06 08:21:34'),
	(10, 21, '2017-12-04 05:33:43'),
	(10, 12, '2017-07-27 05:24:49'),
	(10, 13, '2017-12-25 01:03:57');
  