CREATE DATABASE users_exercise_task_1;
USE users_exercise_task_1;

create table users_exercise_task_1 (
 id int NOT NULL AUTO_INCREMENT,
 name varchar(120) NOT NULL,
 email varchar(220) NOT NULL,
 country varchar(120),
 PRIMARY KEY (id)
);

DELIMITER $$
CREATE PROCEDURE show_list_user()
BEGIN
    SELECT *
    FROM users_exercise_task_1;
    END$$
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE update_user(
name varchar(50),
email varchar(50), 
country varchar(50),
id_user int
)
BEGIN
    update users_exercise_task_1
    set name = name, 
              email= email, 
			  country =country 
              where id = id_user;
    END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE delete_user(id_user int)
BEGIN
    delete from users_exercise_task_1 where id = id_user;
    END$$
DELIMITER ;
SET SQL_SAFE_UPDATES = 0;
call show_list_user();
call delete_user();
call update_user();