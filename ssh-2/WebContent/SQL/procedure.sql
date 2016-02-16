#存储过程笔记
使用参数
create procedure productpricing(
	out p1 decimal(8,2),
	out p2 decimal(8,2),
	out p3 decimal(8,2)
)
begin
	select min(prod_price)
	into p1
	from products;
	select max(prod_price)
	into p2
	from products;
	select avg(prod_price)
	into p3
	from products;
end ;
1.在mysql中支持in(传递给存储过程),out(存储过程传递出的参数)
inout(对存储过程传入和传出)类型的参数
2.存储过程的带位于begin end语句内
3.调用有参数的存储过程
call productpricing(@pricelow,@pricehigh,@priceaverage);
4.所以mysql变量都必须@开始
5.查询出刚刚定义的变量
select @priceaverage;
create procedure ordertotal(
in onnumber int,
out ototal deciaml(8,2))
begin
	select sum(item_price * quantity)
	from orderitem
	where order_num=onumber
	into ototal;
end;
调用存储过程
call ordertoal(2141,@total);
检查存储过程
使用命令
show create procedure
show create procedure ordertotal;


