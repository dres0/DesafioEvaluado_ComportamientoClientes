SELECT * FROM cliente;
SELECT * FROM compra;
SELECT * FROM detalle_compra;
SELECT * FROM producto;

BEGIN TRANSACTION;
INSERT INTO compra (id, cliente_id, fecha)
VALUES (33, 1, current_date);   
INSERT INTO detalle_compra (id, producto_id, compra_id, cantidad)
VALUES (43, 9, 32, 5);
UPDATE producto SET stock = stock - 5 WHERE id = 9;
SELECT * FROM producto;
COMMIT;

BEGIN TRANSACTION;
SAVEPOINT checkpoint;
INSERT INTO compra (id, cliente_id, fecha)
VALUES (34, 2, current_date);
INSERT INTO detalle_compra (id, producto_id, compra_id, cantidad)
VALUES (44, 1, 33, 3);
UPDATE producto SET stock = stock - 3 WHERE id = 1;
INSERT INTO compra (id, cliente_id, fecha)
VALUES (35, 2, current_date);
INSERT INTO detalle_compra (id, producto_id, compra_id, cantidad)
VALUES (45, 2, 34, 3);
UPDATE producto SET stock = stock - 3 WHERE id = 2;
INSERT INTO compra (id, cliente_id, fecha)
VALUES (36, 2, current_date); 
INSERT INTO detalle_compra (id, producto_id, compra_id, cantidad)
VALUES (46, 8, 35, 3);
UPDATE producto SET stock = stock - 3 WHERE id = 8;
SELECT * FROM producto;
ROLLBACK TO checkpoint;
COMMIT;


BEGIN TRANSACTION;
SAVEPOINT checkpoint2;
INSERT INTO cliente (id, nombre, email)
VALUES (11, 'usuario11', 'usuario11@gmail.com');
SELECT * FROM cliente;
ROLLBACK TO checkpoint2;
SELECT * FROM cliente;
COMMIT;

-- pg_dump -U dres0 -d pizzeria  >  bill_nueva.sql  ESTE COMANDO GUARDA LA BASE DE DATOS|