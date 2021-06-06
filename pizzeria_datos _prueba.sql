-- categorie pizza 
INSERT INTO `s2_n1_ex2`.`categorias pizza` (`id`, `name`) VALUES ('1', 'pizza bianca');
INSERT INTO `s2_n1_ex2`.`categorias pizza` (`id`, `name`) VALUES ('2', 'vegetariana');
INSERT INTO `s2_n1_ex2`.`categorias pizza` (`id`, `name`) VALUES ('3', 'tradizionale');
INSERT INTO `s2_n1_ex2`.`categorias pizza` (`id`, `name`) VALUES ('4', 'calzone');

-- provincias
INSERT INTO `s2_n1_ex2`.`provincia` (`id`, `name`) VALUES ('1', 'Barcelona');
INSERT INTO `s2_n1_ex2`.`provincia` (`id`, `name`) VALUES ('2', 'Madrid');
INSERT INTO `s2_n1_ex2`.`provincia` (`id`, `name`) VALUES ('3', 'Zaragoza');
INSERT INTO `s2_n1_ex2`.`provincia` (`id`, `name`) VALUES ('4', 'Gerona');

-- localidad
INSERT INTO `s2_n1_ex2`.`localidad` (`id`, `name`, `provincia_id`) VALUES ('1', 'Badalona', '1');
INSERT INTO `s2_n1_ex2`.`localidad` (`id`, `name`, `provincia_id`) VALUES ('2', 'Montcada', '1');
INSERT INTO `s2_n1_ex2`.`localidad` (`id`, `name`, `provincia_id`) VALUES ('3', 'el prat', '1');

-- clients
INSERT INTO `s2_n1_ex2`.`clients` (`id`, `name`, `surname`, `address`, `post_code`, `client_phone`, `localidad_id`) VALUES ('1', 'mario', 'rossi', 'c/ cerdenya 123', '08110', '4568456123', '1');
INSERT INTO `s2_n1_ex2`.`clients` (`id`, `name`, `surname`, `address`, `post_code`, `client_phone`, `localidad_id`) VALUES ('2', 'tizio', 'bianchi', 'c/ mallorca 34', '08002', '123456789', '1');
INSERT INTO `s2_n1_ex2`.`clients` (`id`, `name`, `surname`, `address`, `post_code`, `client_phone`, `localidad_id`) VALUES ('3', 'caio ', 'verdi', 'c/ menorca 12', '08003', '456789879', '2');
INSERT INTO `s2_n1_ex2`.`clients` (`id`, `name`, `surname`, `address`, `post_code`, `client_phone`, `localidad_id`) VALUES ('4', 'sempronio', 'motta', 'c/ sepulveda', '08002', '123123123', '2');

-- restaurants
INSERT INTO `s2_n1_ex2`.`restaurant` (`id`, `address`, `post_code`, `localidad_id`) VALUES ('1', 'c/ santa marta', '08001', '1');
INSERT INTO `s2_n1_ex2`.`restaurant` (`id`, `address`, `post_code`, `localidad_id`) VALUES ('2', 'c/ pelayo', '08001', '1');
INSERT INTO `s2_n1_ex2`.`restaurant` (`id`, `address`, `post_code`, `localidad_id`) VALUES ('3', 'c/ tallers', '08001', '1');

-- employees
INSERT INTO `s2_n1_ex2`.`employees` (`id`, `name`, `surname`, `type`, `nif`, `phone`, `restaurant_id`) VALUES ('1', 'jose', 'ramirez', 'chef', 'asdasd', '123123132', '1');
INSERT INTO `s2_n1_ex2`.`employees` (`id`, `name`, `surname`, `type`, `nif`, `phone`, `restaurant_id`) VALUES ('2', 'carlos', 'sanchez', 'delivery', 'qweq', '65464', '1');
INSERT INTO `s2_n1_ex2`.`employees` (`id`, `name`, `surname`, `type`, `nif`, `phone`, `restaurant_id`) VALUES ('3', 'maria', 'diaz', 'chef', 'xcv', '5465', '2');
INSERT INTO `s2_n1_ex2`.`employees` (`id`, `name`, `surname`, `type`, `nif`, `phone`, `restaurant_id`) VALUES ('4', 'esther', 'lopez', 'delivery', 'asda', '123123', '2');

-- products
INSERT INTO `s2_n1_ex2`.`products` (`products_id`, `product_name`, `type`, `description`, `price`, `categoria_pizza_id`) VALUES ('1', 'margherita', 'pizza', 'asda', '10', '4');
INSERT INTO `s2_n1_ex2`.`products` (`products_id`, `product_name`, `type`, `description`, `price`, `categoria_pizza_id`) VALUES ('2', '4 stagioni', 'pizza', 'qweqw', '11', '4');
INSERT INTO `s2_n1_ex2`.`products` (`products_id`, `product_name`, `type`, `description`, `price`, `categoria_pizza_id`) VALUES ('3', '4 formaggi', 'pizza', 'dfsdf', '12', '1');
INSERT INTO `s2_n1_ex2`.`products` (`products_id`, `product_name`, `type`, `description`, `price`) VALUES ('4', 'cheesburger', 'hambuger', 'dqwdq', '4');
INSERT INTO `s2_n1_ex2`.`products` (`products_id`, `product_name`, `type`, `description`, `price`) VALUES ('5', 'happy meal', 'hambuger', 'assaa', '10');
INSERT INTO `s2_n1_ex2`.`products` (`products_id`, `product_name`, `type`, `description`, `price`) VALUES ('6', 'cocacola', 'drink', 'asda', '2');
INSERT INTO `s2_n1_ex2`.`products` (`products_id`, `product_name`, `type`, `description`, `price`) VALUES ('7', 'fanta', 'drink', 'werwe', '2');
INSERT INTO `s2_n1_ex2`.`products` (`products_id`, `product_name`, `type`, `description`, `price`) VALUES ('8', 'cerveza', 'drink', 'ñjñljk', '3');
INSERT INTO `s2_n1_ex2`.`products` (`products_id`, `product_name`, `type`, `description`, `price`) VALUES ('9', 'agua', 'drink', 'asdqwe', '1');

-- orders
INSERT INTO `s2_n1_ex2`.`order` (`order_id`, `order_time`, `type`, `price`, `client_id`, `restaurant_id`) VALUES ('1', '2020-02-02', 'delivery', '10', '1', '1');
INSERT INTO `s2_n1_ex2`.`order` (`order_id`, `order_time`, `type`, `price`, `client_id`, `restaurant_id`) VALUES ('2', '2020-02-02', 'take away', '10', '1', '1');
INSERT INTO `s2_n1_ex2`.`order` (`order_id`, `order_time`, `type`, `price`, `client_id`, `restaurant_id`) VALUES ('3', '2020-02-02', 'delivery', '10', '1', '2');
INSERT INTO `s2_n1_ex2`.`order` (`order_id`, `order_time`, `type`, `price`, `client_id`, `restaurant_id`) VALUES ('4', '2020-02-02', 'delivery', '10', '2', '2');
INSERT INTO `s2_n1_ex2`.`order` (`order_id`, `order_time`, `type`, `price`, `client_id`, `restaurant_id`) VALUES ('5', '2020-02-02', 'take away', '10', '2', '1');
INSERT INTO `s2_n1_ex2`.`order` (`order_id`, `order_time`, `type`, `price`, `client_id`, `restaurant_id`) VALUES ('6', '2020-02-02', 'delivery', '10', '2', '1');
INSERT INTO `s2_n1_ex2`.`order` (`order_id`, `order_time`, `type`, `price`, `client_id`, `restaurant_id`) VALUES ('7', '2020-02-02', 'delivery', '10', '3', '1');
INSERT INTO `s2_n1_ex2`.`order` (`order_id`, `order_time`, `type`, `price`, `client_id`, `restaurant_id`) VALUES ('8', '2020-02-02', 'take away', '10', '3', '2');
INSERT INTO `s2_n1_ex2`.`order` (`order_id`, `order_time`, `type`, `price`, `client_id`, `restaurant_id`) VALUES ('9', '2020-02-02', 'delivery', '10', '3', '3');
INSERT INTO `s2_n1_ex2`.`order` (`order_id`, `order_time`, `type`, `price`, `client_id`, `restaurant_id`) VALUES ('10', '2020-02-02', 'take away', '10', '1', '1');

-- in-order
INSERT INTO `s2_n1_ex2`.`in_order` (`in_order_id`, `product_quantity`, `price`, `order_id`, `products_id`) VALUES ('1', '10', '10', '1', '7');
INSERT INTO `s2_n1_ex2`.`in_order` (`in_order_id`, `product_quantity`, `price`, `order_id`, `products_id`) VALUES ('2', '11', '11', '1', '8');
INSERT INTO `s2_n1_ex2`.`in_order` (`in_order_id`, `product_quantity`, `price`, `order_id`, `products_id`) VALUES ('3', '22', '22', '2', '9');
INSERT INTO `s2_n1_ex2`.`in_order` (`in_order_id`, `product_quantity`, `price`, `order_id`, `products_id`) VALUES ('4', '33', '33', '2', '9');

-- shipping
INSERT INTO `s2_n1_ex2`.`shipping` (`id`, `time`, `employee_id`, `restaurant_id`, `order_id`, `client_id`) VALUES ('1', '2020-05-05', '1', '1', '1', '1');
INSERT INTO `s2_n1_ex2`.`shipping` (`id`, `time`, `employee_id`, `restaurant_id`, `order_id`, `client_id`) VALUES ('2', '2020-05-05', '1', '1', '2', '1');
INSERT INTO `s2_n1_ex2`.`shipping` (`id`, `time`, `employee_id`, `restaurant_id`, `order_id`, `client_id`) VALUES ('3', '2020-05-05', '2', '1', '5', '2');
INSERT INTO `s2_n1_ex2`.`shipping` (`id`, `time`, `employee_id`, `restaurant_id`, `order_id`, `client_id`) VALUES ('4', '2020-05-05', '3', '2', '4', '2');
