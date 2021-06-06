-- clients
INSERT INTO `s2_n1_ex1`.`client` (`client_id`, `client_name`, `client_address`, `client_phone`, `client_email`, `client_registration`) VALUES ('1', 'mario', 'c/ de Sant Ignaci', '365412587', 'mario@gmail.com', '2020-02-02');
INSERT INTO `s2_n1_ex1`.`client` (`client_id`, `client_name`, `client_address`, `client_phone`, `client_email`, `client_registration`, `client_referred_by`) VALUES ('2', 'tizio', 'c/ de sardenya', '87465984', 'tizio@gmail.com', '2020-05-05', '1');
INSERT INTO `s2_n1_ex1`.`client` (`client_id`, `client_name`, `client_address`, `client_phone`, `client_email`, `client_registration`, `client_referred_by`) VALUES ('3', 'caio', 'c/ de sepulveda', '7896547', 'caio@gmail.com', '2019-04-04', '1');
INSERT INTO `s2_n1_ex1`.`client` (`client_id`, `client_name`, `client_address`, `client_phone`, `client_email`, `client_registration`, `client_referred_by`) VALUES ('4', 'sempronio', 'c/ de mallorca', '521456987', 'sempronio@gmail.com', '2018-01-01', '3');

-- proveidors 
INSERT INTO `s2_n1_ex1`.`proveidors` (`proveidors_id`, `prov_address`, `prov_phone`, `prov_fax`, `prov_nif`, `prov_name`) VALUES ('1', 'c/ de corsega', '789456123', '1047258', 'qwerty', 'barcelona');
INSERT INTO `s2_n1_ex1`.`proveidors` (`proveidors_id`, `prov_address`, `prov_phone`, `prov_fax`, `prov_nif`, `prov_name`) VALUES ('2', 'c/ de menorca', '456789789', '12312', 'asdfgh', 'madrid');
INSERT INTO `s2_n1_ex1`.`proveidors` (`proveidors_id`, `prov_address`, `prov_phone`, `prov_fax`, `prov_nif`, `prov_name`) VALUES ('3', 'c/ de picasso', '123456879', '258258', 'zxcvbn', 'alicante');

-- marcas 
INSERT INTO `s2_n1_ex1`.`marca` (`marca_id`, `marca_name`, `proveidors_id`) VALUES ('1', 'rayban', '1');
INSERT INTO `s2_n1_ex1`.`marca` (`marca_id`, `marca_name`, `proveidors_id`) VALUES ('2', 'oaks', '1');
INSERT INTO `s2_n1_ex1`.`marca` (`marca_id`, `marca_name`, `proveidors_id`) VALUES ('3', 'sisley', '2');
INSERT INTO `s2_n1_ex1`.`marca` (`marca_id`, `marca_name`, `proveidors_id`) VALUES ('4', 'guess', '1');

-- montura
INSERT INTO `s2_n1_ex1`.`montura` (`montura_id`, `montura_type`, `montura_color`) VALUES ('1', 'flotante', 'azul');
INSERT INTO `s2_n1_ex1`.`montura` (`montura_id`, `montura_type`, `montura_color`) VALUES ('2', 'pasta', 'rojo');
INSERT INTO `s2_n1_ex1`.`montura` (`montura_id`, `montura_type`, `montura_color`) VALUES ('3', 'flotante', 'gris');
INSERT INTO `s2_n1_ex1`.`montura` (`montura_id`, `montura_type`, `montura_color`) VALUES ('4', 'metalica', 'amarillo');

-- seller
INSERT INTO `s2_n1_ex1`.`seller` (`seller_id`, `seller_name`) VALUES ('1', 'mario');
INSERT INTO `s2_n1_ex1`.`seller` (`seller_id`, `seller_name`) VALUES ('2', 'gianni');
INSERT INTO `s2_n1_ex1`.`seller` (`seller_id`, `seller_name`) VALUES ('3', 'jose');
INSERT INTO `s2_n1_ex1`.`seller` (`seller_id`, `seller_name`) VALUES ('4', 'jaime');

-- ulleres
INSERT INTO `s2_n1_ex1`.`ulleres` (`ulleres_id`, `ull_preu`, `montura_id`, `vidre_right_color`, `vidre_right_grad`, `vidre_left_color`, `vidre_left_grad`, `client_id`, `seller_id`, `marca_id`, `ulleres_sale_date`) VALUES ('1', '50', '1', 'transparente', '2', 'transparente', '2', '1', '3', '2', '2020-09-09');
INSERT INTO `s2_n1_ex1`.`ulleres` (`ulleres_id`, `ull_preu`, `montura_id`, `vidre_right_color`, `vidre_right_grad`, `vidre_left_color`, `vidre_left_grad`, `client_id`, `seller_id`, `marca_id`, `ulleres_sale_date`) VALUES ('2', '70', '2', 'azul', '1', 'azul', '2', '2', '1', '1', '2018-08-08');
INSERT INTO `s2_n1_ex1`.`ulleres` (`ulleres_id`, `ull_preu`, `montura_id`, `vidre_right_color`, `vidre_right_grad`, `vidre_left_color`, `vidre_left_grad`, `client_id`, `seller_id`, `marca_id`, `ulleres_sale_date`) VALUES ('3', '100', '3', 'naranja', '2', 'naranja', '1.3', '3', '4', '3', '2017-04-04');
