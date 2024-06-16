CREATE or REPLACE VIEW allfavorite as
 SELECT favorite.* , books.* , users.users_id from favorite 
 INNER JOIN users ON users.users_id=favorite.favorite_userid
INNER JOIN books  ON books.Book_id =favorite.favorite_bookid
 
 
 