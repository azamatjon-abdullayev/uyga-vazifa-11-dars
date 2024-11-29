create table if not exists categories(
	id serial primary key not null,
	category_name VARCHAR(100) not null,
	description text
);

create table if not exists news(
	news_id serial primary key not null,
	category_id integer REFERENCES categories(id),
	title varchar(200),
	content text,
	published_at date default current_date,
	is_published BOOLEAN default FALSE
);

create table if not exists commentlar(
	comment_id serial primary key,
	news_id INTEGER REFERENCES news(news_id),
	author_name varchar(100),
	comment_text text,
	created_at date default current_date
);

alter table news
add column viewslar INTEGER default 5;

select * from categories;
select * from news;
select * from commentlar;

insert into categories(category_name,description)VALUES
('ichimliklar','zor'),
('shirinliklar','yaxshi'),
('taomlar','ortacha');

INSERT into news(category_id,title,content)VALUES
(1,'pepsi','yangi'),
(2,'biscuit','yangi'),
(3,'osh','yangi');

insert into commentlar(news_id,author_name,comment_text)VALUES
(1,'ali','bir tiyinga qimmat'),
(2,'vali','bir tiyinga qimmat'),
(3,'bali','bir tiyinga qimmat');

insert into news(title,viewslar)VALUES
('pepsi',10)
on conflict(title)
do update set viewslar = 10;

SELECT n.id AS news_id, n.title AS headline, n.category AS category
FROM news AS n;

SELECT *
FROM commentlar
WHERE author_name ILIKE 'A%';

SELECT *
FROM commentlar
WHERE author_name ILIKE '% %';


