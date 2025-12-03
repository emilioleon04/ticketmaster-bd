UPDATE cliente c
SET cartera_id = car.cartera_id
FROM cartera car
WHERE c.cliente_id = car.cliente_id;