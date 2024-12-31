
use music_database;
select * from album;
#Who is the seniormost employee based on job title?
select * from employee
ORDER BY levels desc
limit 1;

#Which countries have the most invoices
 select * from invoice;
 select count(*),billing_country from invoice #finds total number of rows in invoice table
 group by billing_country
 order by count(*) desc
 
 #Top 3 values of total invoice 
 select * from invoice;
 select total from invoice order by total desc
 limit 3;
 
 #Which city has the best customers? We would like to throw a promotional music festival in the city we made the most money 
 #Write a query that returns one city that has the highest sum of invoice totals
 #Return both the city name and sum of all invoice totals
 select sum(total) as invoice_total, billing_city from invoice group by billing_city order by invoice_total desc limit 1;
 
 #Who is the best customer? The customer that has spent the most money would be declared the best customer
 #Write a query to retrieve persons who has spend the most money 
 
 
select customer.customer_id, customer.first_name, customer.last_name, sum(invoice.total) as total from customer join invoice ON customer.customer_id=invoice.customer_id
group by customer.customer_id,customer.first_name,customer.last_name
order by total desc limit 1;

#Write a query to return the email, first name,last name and genre of all rock music listeners. Rreturn yourr list ordered alphabetically buy email stating with A
select distinct email,first_name,last_name from customer
join invoice on customer.customer_id=invoice.customer_id
join invoice_line on invoice.invoice_id=invoice_line.invoice_id
where track_id in(select track_id from track join genre on track.genre_id=genre.genre_id where genre.name like 'Rock') order by email;
#Lets invite the artists who have written the most rock music in our dataset. Write a query that returns the artist name and total track count of the top 10 rock brands
select artist.artist_id, artist.name, count(artist.artist_id) as number_of_songs 
from track
join album on album.album_id=track.album_id
join artist on artist.artist_id=album.artist_id
join genre on genre.genre_id=track.genre_id
where genre.name like 'Rock' 
group by artist.artist_id,artist.name
order by number_of_songs desc
limit 10;
--describe album
--ALTER TABLE album
--RENAME COLUMN ï»¿album_id to album_id;
# SELECT list is not in GROUP BY clause and contains nonaggregated column error's solution :SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
#or just use all the columns in the group by that were specified in the select statement


#Return all the track names that have a song length longer than 
#the avergae song length. Return the name and milliseconds for each track and 
#Order by the song length with the longest song listed first--


select name,milliseconds from track where milliseconds>(select avg(milliseconds) as avg_track_length from track) order by milliseconds desc;







