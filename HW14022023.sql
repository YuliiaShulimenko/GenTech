///////////////////////////////////////////// 1 ///////////////////////////////////////////////////////////
Задача (1) - в рамках БД "стриминг платформа"
    - вывести ТОП-1 юзеров по сумме донатов 
        (КТО БОЛЬШЕ ПОЖЕРТВОВАЛ ДОНАТОВ)
    - поля
    - имя_юзера
    - сумма донатов


SELECT users.name, SUM(donations.amount) AS sum_donations
  FROM donations
  LEFT JOIN users ON donations.user_id = users.id
  GROUP BY users.name
  ORDER BY sum_donations DESC
  LIMIT 1


///////////////////////////////////////////// 2 ///////////////////////////////////////////////////////////

ЗАДАЧА (2) - в рамках БД "стриминг платформа"
    - вывести ТОП-3 юзеров по сумме собранных донатов
    
    - поля
    - имя_юзера
    - сумма_собранных_донатов
    
SELECT users.name, SUM(donations.amount) AS sum
  FROM donations
  JOIN users ON donations.user_id = users.id
  GROUP BY users.name
  ORDER BY sum DESC
  LIMIT 3


///////////////////////////////////////////// 3 ///////////////////////////////////////////////////////////
     - спроектировать и создать с помощью SQL БД для "онлайн чат"
     
 CREATE TABLE users (
    id INTEGER PRIMARY KEY auto_increment,
    name TEXT NOT NULL,
    password TEXT NOT NULL,
    email TEXT NOT NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE messages (
    id INTEGER PRIMARY KEY auto_increment,
    user_id INTEGER NOT NULL,
    text TEXT NOT NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE reactions (
    id INTEGER PRIMARY KEY auto_increment,
    user_id INTEGER NOT NULL,
    message_id INTEGER NOT NULL,
    type TEXT NOT NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (message_id) REFERENCES messages(id)
);

CREATE TABLE comments (
    id INTEGER PRIMARY KEY auto_increment,
    user_id INTEGER NOT NULL,
    message_id INTEGER NOT NULL,
    text TEXT NOT NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMEST
