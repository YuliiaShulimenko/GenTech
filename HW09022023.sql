CREATE TABLE Users (
 id INTEGER primary key auto_increment,
 username VARCHAR(128) NOT NULL,
 email VARCHAR(128) NOT NULL,
 datetime DATETIME default current_timestamp,
 password_hash varchar(128) NOT NULL,
 is_blocked BOOL default false
);

CREATE TABLE Videos (
 id INTEGER primary key auto_increment,
 title VARCHAR(128),
 description VARCHAR(128),
 datetime DATETIME,
 duration_secs INTEGER,
 user_id INTEGER
 FOREIGH KEY (user_id) REFERENCES Users(users_id)
);

CREATE TABLE Reactions (
 id INTEGER primary key auto_increment,
 video_id INTEGER,
 FOREIGH KEY (video_id) REFERENCES Users(video_id)
 user_id INTEGER,
 FOREIGH KEY (user_id) REFERENCES Users(users_id)
 datetime DATETIME,
 type VARCHAR(10) NOT NULL
);

CREATE TABLE Comments (
 id INTEGER primary key auto_increment,
 user_id INTEGER,
 FOREIGH KEY (user_id) REFERENCES Users(user_id)
 datetime DATETIME,
 video_id INTEGER,
 FOREIGH KEY (video_id) REFERENCES Users(video_id)
 text TEXT NOT NULL);
