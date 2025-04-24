create table passengers (
    pclass int,
    survived tinyint,
    name varchar(128),
    sex enum('male', 'female'),
    age int,
    ticket varchar(128),
    fare decimal(8, 4),
    cabin varchar(10),
    embarked enum('S', 'C', 'Q'),
    boat varchar(10),
    body int,
    homedest varchar(60)
);