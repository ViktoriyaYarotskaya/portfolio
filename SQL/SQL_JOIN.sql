
Условия задачи
В базе данных риелторской компании есть три таблицы. 
1) Таблица "client", которая содержит информацию о клиентах компании. Она содержит поля: 
"id" – уникальный идентификатор клиента; 
"first_name" – имя клиента; 
"last_name" – фамилия клиента.
2) Таблица "apartment", которая содержит информацию о продаваемых квартирах. Она содержит поля:
"id" – уникальный идентификатор квартиры;
"address" – адрес квартиры;
"rooms" – количество комнат в квартире.
3) Таблица "view", которая содержит информацию о записи на просмотр квартир клиентами. Она содержит поля:
"id" – уникальный идентификатор записи;
"apartment_id" – идентификатор квартиры;
"client_id" – идентификатор клиента, записанного на просмотр;
"date" – дата просмотра квартиры.

Обратите внимание, что на просмотр одной квартиры могут записаться несколько клиентов, а один клиент может записаться на просмотр нескольких квартир.

Ниже представлена схема описанной базы данных.

Составить запрос, результатом которого будет список фамилий клиентов, записанных на просмотр двух и более трехкомнатных квартир.

CREATE TABLE client
(
id UUID PRIMARY KEY, 
first_name TEXT NOT NULL,
last_name TEXT NOT NULL
);

CREATE TABLE apartment
(
id UUID PRIMARY KEY, 
address TEXT NOT NULL,
rooms INT NOT NULL
);

CREATE TABLE view
(
id UUID PRIMARY KEY,
apartment_id INT,
client_id INT,
FOREIGN KEY (apartment_id) REFERENCES apartment (id),
FOREIGN KEY (client_id) REFERENCES client (id),
date TIMESTAMP NOT NULL
);

INSERT INTO client VALUES
(2, 'Anna', 'Ivanova'),
(3, 'Sofia', 'Sidorova'),
(4, 'Marta', 'Beleeva'),
(5, 'Dmitry', 'Belkin'),
(6, 'Vasya', 'Petrov');




INSERT INTO apartment VALUES
(11, 'Lenina street', '3'),
(12, 'Pokrovka street', '3'),
(13, 'Pokrovka street', '2'),
(14, 'Pokrovka street', '1'),
(15, 'Lenina street', '1'),
(16, 'Fanny street', '3');


INSERT INTO view VALUES
(22, 11, 2, '2000-01-01'),
(23, 14, 2, '2000-01-01'),
(24, 16, 2, '2000-01-01'),
(25, 11, 6, '2000-01-01'),
(26, 12, 6, '2000-01-01'),
(27, 14, 5, '2000-01-01'),
(28, 15, 5, '2000-01-01');


РЕШЕНИЕ:

SELECT client.last_name FROM client 
JOIN view ON client.id = view.client_id
JOIN apartment ON view.apartment_id = apartment.id 
WHERE apartment.rooms = 3 
GROUP BY client.last_name
HAVING COUNT(view.client_id) >= 2;
