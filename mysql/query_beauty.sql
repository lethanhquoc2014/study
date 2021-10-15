SELECT 
  *, 
  COUNT(*) as counter 
FROM 
  orders 
  LEFT JOIN order_details ON orders.orderNumber = order_details.orderNumber 
WHERE 
  orders.orderNumber = 123 
  OR orders.orderNumber = 678 
ORDER BY 
  orders.orderNumber desc, 
  orders.orderDate asc 
HAVING 
  counter > 0 
GROUP BY 
  counter 
LIMIT 
  100
