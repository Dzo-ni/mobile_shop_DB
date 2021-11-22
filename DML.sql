INSERT INTO `mobile_shop`.`email_status` (`name`) VALUES ('EMAIL NOT VERIFIED');
INSERT INTO `mobile_shop`.`email_status` (`name`) VALUES ('EMAIL VERIFIED');


INSERT INTO `mobile_shop`.`user_status` (`name`) VALUES ('REGISTERED');
INSERT INTO `mobile_shop`.`user_status` (`name`) VALUES ('ACTIVATED');


INSERT INTO `mobile_shop`.`user_role` (`name`) VALUES ('USER');
INSERT INTO `mobile_shop`.`user_role` (`name`) VALUES ('ADMINISTRATOR');


INSERT INTO `mobile_shop`.`order_status` (`name`) VALUES ('RESERVED');
INSERT INTO `mobile_shop`.`order_status` (`name`) VALUES ('DOESNT SUCCESS');
INSERT INTO `mobile_shop`.`order_status` (`name`) VALUES ('SUCCESSFUL');





INSERT INTO `mobile_shop`.`product` VALUES 
(null, 'Honor 9 Lite (Sapphire Blue, 64 GB)  (4 GB RAM)', 'Honor', '14499.00', '4', '64', '13', 'honor.jpg', 'honor.jpg', 1, 1),
(null, 'Infinix Hot S3 (Sandstone Black, 32 GB)  (3 GB RAM)', 'Infinix', '8999.00', '3', '32', '13', 'honor.jpg', 'honor.jpg' , 1, 0),
(null, 'VIVO V9 Youth (Gold, 32 GB)  (4 GB RAM)', 'VIVO', '16990.00', '4', '32', '16', 'honor.jpg', 'honor.jpg' ,  1, 0),
(null, 'Moto E4 Plus (Fine Gold, 32 GB)  (3 GB RAM)', 'Moto', '11499.00', '3', '32', '8' , 'honor.jpg' , 'honor.jpg', 1, 0),
(null, 'Lenovo K8 Plus (Venom Black, 32 GB)  (3 GB RAM)', 'Lenevo', '9999.00', '3', '32', '13' , 'honor.jpg' , 'honor.jpg',  1 ,  0),
(null, 'Samsung Galaxy On Nxt (Gold, 16 GB)  (3 GB RAM)', 'Samsung', '10990.00', '3', '16', '13' , 'honor.jpg' , 'honor.jpg',  1 , 0),
(null, 'Moto C Plus (Pearl White, 16 GB)  (2 GB RAM)', 'Moto', '7799.00', '2', '16', '8', 'honor.jpg' , 'honor.jpg',  1 , 0),
(null, 'Panasonic P77 (White, 16 GB)  (1 GB RAM)', 'Panasonic', '5999.00', '1', '16', '8', 'honor.jpg' , 'honor.jpg', 1 , 0),
(null, 'OPPO F5 (Black, 64 GB)  (6 GB RAM)', 'OPPO', '19990.00', '6', '64', '16', 'honor.jpg' , 'honor.jpg', 1 , 0),
(null, 'Honor 7A (Gold, 32 GB)  (3 GB RAM)', 'Honor', '8999.00', '3', '32', '13', 'honor.jpg' , 'honor.jpg',  1 , 1),
(null, 'Asus ZenFone 5Z (Midnight Blue, 64 GB)  (6 GB RAM)', 'Asus', '29999.00', '6', '128', '12', 'honor.jpg' , 'honor.jpg', 1 , 1),
(null, 'Redmi 5A (Gold, 32 GB)  (3 GB RAM)', 'MI', '5999.00', '3', '32', '13', 'honor.jpg' , 'honor.jpg', 1 , 1),
(null, 'Intex Indie 5 (Black, 16 GB)  (2 GB RAM)', 'Intex', '4999.00', '2', '16', '8', 'honor.jpg' , 'honor.jpg', 1 , 1),
(null, 'Google Pixel 2 XL (18:9 Display, 64 GB) White', 'Google', '61990.00', '4', '64', '12', 'honor.jpg' , 'honor.jpg', 1 , 1);




INSERT INTO `mobile_shop`.`stock` (`quantity`, `product_id`) VALUES ('10', '1');
INSERT INTO `mobile_shop`.`stock` (`quantity`, `product_id`) VALUES ('10', '2');
INSERT INTO `mobile_shop`.`stock` (`quantity`, `product_id`) VALUES ('10', '3');
INSERT INTO `mobile_shop`.`stock` (`quantity`, `product_id`) VALUES ('10', '4');
INSERT INTO `mobile_shop`.`stock` (`quantity`, `product_id`) VALUES ('10', '5');
INSERT INTO `mobile_shop`.`stock` (`quantity`, `product_id`) VALUES ('10', '6');
INSERT INTO `mobile_shop`.`stock` (`quantity`, `product_id`) VALUES ('10', '7');
INSERT INTO `mobile_shop`.`stock` (`quantity`, `product_id`) VALUES ('10', '8');
INSERT INTO `mobile_shop`.`stock` (`quantity`, `product_id`) VALUES ('10', '9');
INSERT INTO `mobile_shop`.`stock` (`quantity`, `product_id`) VALUES ('10', '10');
INSERT INTO `mobile_shop`.`stock` (`quantity`, `product_id`) VALUES ('10', '11');
INSERT INTO `mobile_shop`.`stock` (`quantity`, `product_id`) VALUES ('10', '12');
INSERT INTO `mobile_shop`.`stock` (`quantity`, `product_id`) VALUES ('10', '13');
INSERT INTO `mobile_shop`.`stock` (`quantity`, `product_id`) VALUES ('10', '14');


INSERT INTO `mobile_shop`.`customer` (`firstname`, `lastname`, `stripe_customer_id`) VALUES ('Admin', 'Admin', 'cus_random_string');
INSERT INTO `mobile_shop`.`user` (`password`, `user_status_id`, `user_role_id`, `customer_id`) VALUES ('$2y$10$9GkS7JoLcUV2NMPLc4QD0eHakK/xhs1uTzoV5pJNMIYYMLI6GcWpK', '2', '2', '1');
INSERT INTO `mobile_shop`.`email` (`email_address`, `activation_code`, `email_status_id`, `on_mailing`,	`is_customer_registered` , `customer_id`) VALUES ('admin@yahoo.com', 'dSvDyVcv8j3SmGTFq4De', '2', '1','1', '1');



