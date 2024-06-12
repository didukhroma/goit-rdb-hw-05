use hw3;
-- 1
select *,
(select customer_id from orders o where od.order_id = o.id) customer_id
 from order_details od;

-- 2
select *
 from order_details od
 where order_id in (select id from orders where  orders.shipper_id=3);
 
-- 3
select order_id, round(avg(quantity),2) average
 from (select * from order_details where quantity > 10)  temple_table
 group by order_id;
 
-- 4
with temple_table as (select * from order_details where quantity > 10)
select order_id, round(avg(quantity),2) average
from temple_table
group by order_id;

-- 5
drop function if exists divideFunction;

delimiter //
create function divideFunction (first_num float, second_num float)
returns float
deterministic 
no sql
begin
declare result float;
set result = round(first_num / second_num,2);
return result;
end//
delimiter ;


 select *,divideFunction(od.quantity,2) dividedQuantity from order_details od;
