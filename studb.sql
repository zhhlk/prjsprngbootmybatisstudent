CREATE DATABASE mydb;
USE mydb;
CREATE TABLE clazz(
  cid INT PRIMARY KEY AUTO_INCREMENT,
  cname VARCHAR(50) NOT NULL
);


CREATE TABLE student(
  sid INT PRIMARY KEY AUTO_INCREMENT,
  sname VARCHAR(50) NOT NULL,
  sex VARCHAR(4),
  address VARCHAR(50),
  birthday DATE,
  classid INT NOT NULL,
  CONSTRAINT fk_classid FOREIGN KEY (classid)
  REFERENCES clazz(cid)
);
INSERT INTO clazz(cname) VALUES('java1班');
INSERT INTO clazz(cname) VALUES('java2班');
INSERT INTO clazz(cname) VALUES('java3班');
INSERT INTO clazz(cname) VALUES('java4班');
INSERT INTO clazz(cname) VALUES('java5班');

INSERT INTO student(sname,sex,address,birthday,classid)
VALUES('张飞','男','西安','1998-01-01',1);
INSERT INTO student(sname,sex,address,birthday,classid)
VALUES('马超','男','汉中','1998-01-01',1);
INSERT INTO student(sname,sex,address,birthday,classid)
VALUES('关羽','男','运城','1998-01-01',2);

SELECT * FROM clazz;

SELECT * FROM student;

SELECT s.*,c.cname FROM student s,clazz c WHERE s.classid=c.cid;

