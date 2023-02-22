Условия задачи:

Дана таблица с параметрами перевозок:
1) Колонка "Пункт отправления", значения: Москва, Липецк, Ярославль, Санкт-Петербург, Липецк, Москва
2) Колонка "Пункт назначения", значения: Санкт-Петербург, Москва, Санкт-Петербург, Москва, Курск, Ярославль
3) Колонка "Масса груза, тонна", значения: 5, 2, 3, 4, 5, 2
4) Колонка "Объем груза, м3", значения: 10, 7, 8, 12, 15, 10	

Составьте SQL- запрос для выбора всех перевозок в Москву с грузом более 2 тонн.

Решение:

1. Создаем таблицу:

CREATE TABLE transport (
from TEXT,
to TEXT,
weight INT,
size INT);


2. Заполняем таблицу:

INSERT INTO transport VALUES
('Москва',  'Санкт-Петербург', 2, 10),
('Липецк', 'Москва', 2, 7),
('Ярославль', 'Санкт-Петербург', 3, 8),
('Санкт-Петербург', 'Москва', 4, 12),
('Липецк', 'Курск', 5, 15),
('Москва', 'Ярославль', 2, 10);


3. Решение задачи:

SELECT to, weight
FROM transport
WHERE to = ‘Москва’ AND weight >= 2;