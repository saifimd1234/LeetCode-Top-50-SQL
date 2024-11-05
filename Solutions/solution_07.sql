SELECT p.product_name, s.year, s.price
FROM Sales s
LEFT JOIN Product p
ON s.product_id=p.product_id;

select Product.Product_name as product_name,Sales.year,Sales.price
from sales left join product using (product_id);