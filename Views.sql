-- Создание представления (VIEW)
CREATE VIEW vw_account_and_status AS
SELECT 
    a.id_account, 
    a.account_number, 
    a.last_name, 
    a.name, 
    a.id_account_status, 
    s.account_status
FROM 
    account AS a
INNER JOIN 
    account_status AS s
ON 
    s.id_account_status = a.id_account_status;

-- Удаление существующего представления
DROP VIEW vw_account_and_status;

-- Просмотр данных из представления
SELECT * FROM vw_account_and_status;

-- Запрос с объединением данных
SELECT 
    a.id_account, 
    a.account_number, 
    a.last_name, 
    a.name, 
    a.id_account_status, 
    s.account_status, 
    l.id_account_line, 
    l.number, 
    l.price_full
FROM 
    vw_account_and_status AS a
INNER JOIN 
    account_line AS l
ON 
    a.id_account = l.id_account
ORDER BY 
    a.account_number, l.number;
