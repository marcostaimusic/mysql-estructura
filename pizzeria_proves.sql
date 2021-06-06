SELECT COUNT(p.products_id) FROM s2_n1_ex2.products p JOIN s2_n1_ex2.in_order io ON p.products_id = io.products_id JOIN s2_n1_ex2.order o ON o.order_id = io.order_id JOIN s2_n1_ex2.clients c ON c.id = o.client_id JOIN s2_n1_ex2.localidad l ON c.localidad_id = l.id WHERE l.id = 1 AND p.type = "drink";
SELECT COUNT(s.order_id) FROM s2_n1_ex2.shipping s WHERE s.employee_id = 1;