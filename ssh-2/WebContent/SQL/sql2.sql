实验一   MySQL工具的使用和数据库的简单查询
一、实验目的
	1、熟悉MySQL命令行实用程序的使用。
	2、学会用命令行工具了解数据库和表的相关信息。 
	3、掌握简单的SQL语句的使用，学会运用SQL语句进行简单的查询。
二、实验理论基础及教材对应关系
	1、实验理论基础：
		（1）MySQL基本命令；
		（2）SELECT语句；
	2、本实验内容主要对应于教材第3章和第4章。
-------------------------------------------------------------------------------------------------------

实验二   排序检索数据和数据过滤
	一、实验目的
		1、进一步掌握查询的方法，对查询的结果根据需要进行排序。
		2、掌握使用where子句知道搜索条件的方法。
		3、熟练掌握使用and操作符和or操作符进行查询。
	二、实验理论基础及教材对应关系
		1、实验理论基础：
		（1）select语句中的order by 子句；
		（2）where子句；
		（3）and、or、in和not操作符。
		2、本实验内容主要对应于教材第5章、第6章和第7章的内容。
		SELECT    prod_name 
		FROM        products 
		ORDER  BY  prod_name; 

	#指定排序方向
	#从产品表中找出产品的标号、产品价格、产品名，并按产品价格从高到低排序。
		select prod_id,prod_price,prod_name from products order by prod_price desc;
	
	#order by 和limit的组合：找出产品价格最贵的价格。
		select prod_id,prod_price,prod_name from product order by desc limit 1;
	
	#4、where子句：
	#（1）找出产品名为“fuses”的产品名和价格
		select prod_name,prod_price where prod_name = 'fuses';
	
	注意：由于表中的数据在字符前后有空格，因此应将条件写成 ‘ fuses  ’，即在fuses前后加一个空格，否则将找不到结果。
	#找出产品名小于或等于10美元的产品名和价格
		select prod_name,prod_price from products where prod_price<=10;
	
	#5.and操作符：
	找出供应商1003制造且价格小于等于10美元的所有产品的名称和价格。
		select prod_name,prod_price from products where vend_id=1003 or prod_price <=10;
	#7.in操作符：
	
		select * from products where vendor_id in (1002,1005);
	
	#not操作符
	找出不是供应商1002和1003提供的任意产品
		select * from products where vendor_id not in(1002,1003) order by prod_name;
-------------------------------------------------------------------------------------------------------


实验三   数据库的建立和表的操作
一、实验目的
1、掌握创建数据库和表的方法。
2、掌握修改表结构和删除表的方法。
3、熟练掌握给表添加和删除记录的方法。
二、实验理论基础及教材对应关系
1、实验理论基础：
（1）建立数据库、建立表；
（2）修改表结构；
（3）删除表。
（4）表中记录的添加和删除。
2、本实验内容主要对应于教材第19、21章的内容。

三、实验内容与步骤
1、创建数据库
命令格式：create database 数据库名称；
	create database mydatabase;
	
   以自己的名字的汉语拼音为数据库的名称，创建数据库，并用show命令查看所建立的数据库（show databases ）。

2、创建表
	命令格式：create table 表的名称；
	create table mytable;
	注意：在创建表前应使用use 命令选中数据库，在此用 use lisi；（其中lisi是刚才创建的数据库名）。
	
	（1）创建表products(prod_id  char(10), vend_id int,prod_name char(255),  prod_price	decimal(8,2))
		create table product(
			prod_id char(10) primary key auto_increament,
			ven_id int,
			prod_name char(255),
			prod_price decimal(8,2);
		)engine=INNODB;
		
	（2）创建表customers(cust_id int,cust_name char(50) ,cust_address char(50),  cust_city char(50), cust_email char(50)) 要求以cust_id为关键字。
		create table customers(
			cust_id int primary key,
			cust_name char(50),
			cust_address char(50),
			cust_city char(50)
			cust_email(50)
		)
		
	（3）创建表orders(order_num ，order_date，cust_id)要求order_num和	cust_id 字段为整型 order_date字段为日期型。
		create table orders(
			order_num int primary key,
			order_date date;
			cust_id int 
		)	
	
	（4）使用show命令查看创建的表，并将结果写入实验报告，包括创建表的命令。
		show tables;
		
3、修改表结构
	（1）给表添加一个字段
	命令格式：alter table 表名称 add 字段名 字段类型；
	给products添加一个产品描述字段prod_desc，类型为text。命令如下：
	alter table product add prod_desc text;
	#alter table products add prod_desc text;	
	
	再给表products添加一个字段prod_date ,类型为datetime。
	alter table product add prod_date datetime;
	
	（2）使用show命令查看修改后的表的结构，并将结果写入实验报告，包括修改表的命令。
	show columns from product;
	
	（3）修改字段名
	
	命令格式：alter table 表名称 change 原字段名 新字段名 字段类型；

	将products表的prod_desc字段修改为prod_ introduction，类型为char(255)。命令如下：
	alter table products change prod_desc prod_introduction char(255);
	#alter table products change prod_desc prod_introduction char(255);

	再将表products的字段prod_date , 修改为prod_discount，类型为decimal(10,2)。
	alter table products chanage prod_date prod_discount decimal()10,2);
	
   （4）使用show命令查看修改后的表的结构，并将结果写入实验报告，包括修改表的命令。
   show columns from products;
   
   （5）删除表的字段
	
	命令格式：alter table 表名称 drop column字段名；

	将orders表的order_date字段删除的命令如下：
	alter table orders drop column order_date;
	#alter table orders  drop column order_date;

	再将表orders表的cust_id字段删除。
	alter table orders drop column cust_id;
	
	（4）使用show命令查看删除后的表的结构，并将结果写入实验报告，包括删除的命令。
	show columns from orders;
	
	4、删除表
	命令格式：drop table表名称；

	要求删除表orders，并将结果写入实验报告。
	drop table orders;
	
	5、表中记录的添加
	命令格式：insert  into 表名(字段名1, 字段名2, …, 字段名n)
	values(值1, 值2, …, 值n);
	给表customers添加两行记录的方式如下：
	insert into customers(cust_id,cust_name,cust_address,cust_city,cust_email);
	values(10001, 'Coyote Inc.', '200 Maple Lane', 'Detroit', 'ylee@coyote.com');
	#insert  into customers(cust_id, cust_name, cust_address, cust_city, cust_email)
	#values(10001, 'Coyote Inc.', '200 Maple Lane', 'Detroit', 'ylee@coyote.com');
	#insert  into customers (cust_id, cust_name, cust_address, cust_city, cust_email)
	#values (10003, 'Wascals', '1 Sunny Place', 'Muncie', 'rabbit@wascally.com');
	
 实验：给表products添加三行记录
	('ANV02', 1001, '1 ton anvil', 9.99)
	('ANV03', 1001, '2 ton anvil', 14.99)
	('OL1', 1002, 'Oil can', 8.99)
	将实验结果写入实验报告。
	insert into products values('ANV02', 1001, '1 ton anvil', 9.99);
	insert into products values('ANV03', 1001, '2 ton anvil', 14.99);
	insert into products values('OL1', 1002, 'Oil can', 8.99);
	
	6、表中记录的删除
	删除表customers中cust_id为10001的记录的命令如下：
	delete from customers where cust_id=10001;
	删除表products中prod_id为'OL1'的记录。
	将实验结果写入实验报告。
---------------------------------------------------------------------------------------------------------
实验四   正则表达式和创建计算字段

一、实验目的
		1、掌握正则表达式的使用方法，学会运用正则表达式进行查询。
		1、掌握创建计算字段的方法。
		2、学会拼接字段和使用别名。
二、实验理论基础及教材对应关系
	1、实验理论基础：
		（1）正则表达式
		（2）计算字段；
		（3）别名；
	2、本实验内容主要对应于教材第9-10章的内容。
三、实验内容与步骤
	1、使用正则表达式进行查询。
	（1）实验1 找出产品名中包含1-5 ton的产品
		使用下列语句进行查询，并将结果写入实验报告中。
		select prod_name
		from products
		where prod_name regexp '[1-5] Ton';
		
		#Select    prod_name 
		#From      products 
		#Where    prod_name  regexp  '[1-5] Ton' 
	
	（2）实验2 找出供应商中包含 “ . ” 的供应商名称
		使用下列语句进行查询，并将结果写入实验报告中。
			select vend_name
			from vendors
			where vend_name regexp '\\.';
		
			#Select      vend_name 
			#From          vendors 
			#Where     vend_name regexp  '\\.' 
	（3）实验3找出产品名中包含4位连续数字的产品
		使用下列语句进行查询，并将结果写入实验报告中。
			select prod_name
			from products
			where prod_name regexp '[[:digit:]]{4}';
			#Select      prod_name 
			#From         products 
			#Where       prod_name  regexp  '[[:digit:]]{4}'

	2、拼接字段
		实验4  找出供应商的名字，并在名字后注明其国籍
			使用下列语句进行查询，并将结果写入实验报告中。
			select concat(vend_name,'(',vend_country,')');
			from vendors;
			
			#Select   Concat(vend_name, ' (', vend_country, ')') 
			#From       vendors
	3、使用别名
		实验5  找出供应商的名字，在名字后注明其国籍，并将结果作为新的一列。
		
			使用下列语句进行查询，并将结果写入实验报告中。
			select concat(vend_name,'(',vend_country,')') as vend_title;
			from vendors;
			
			#Select  Concat(vend_name, ' (', vend_country, ')')  AS vend_title
			#From       vendors
			
	4、执行算术计算
		实验6  从订单表找出订单号为2005的所有物品的费用（将其作为新的一列）
		
		使用下列语句进行查询，并将结果写入实验报告中。
		Select    prod_id, quantity, item_price,  quantity*item_price  AS  expanded_price
		 From       orderitems 
		Where     order_num = 20005; 

四、实验材料的提交与成绩评定
	1、本实验的实验报告一份（电子版或纸质版一份，具体形式由任课教师确定，格式参考学院统一实验报告）
	2、实验源程序一份，请表明题号（电子版）
	备注：做下一次实验之时提交上一次实验的材料，由各班学习委员以班为单位收集并上交任课教师。
	3、实验成绩总分为10分，由指导老师根据学生实验表现和实验材料进行评定，本门课程结束后实验平均成绩（实验总成绩/实验次数）按照10％的比例记入期末考试总成绩。
-------------------------------------------------------------------------------------------------------------------------------------------------------


实验五   汇总数据和分组数据

一、实验目的
	1、掌握聚集函数的使用方法，学会运用聚集函数进行汇总数据。
	1、掌握创建分组的方法。
	2、掌握过滤分组的方法。
二、实验理论基础及教材对应关系
	1、实验理论基础：
	（1）汇总数据
	（2）数据分组；
	2、本实验内容主要对应于教材第12-13章的内容。
三、实验内容与步骤
	1、使用avg()函数，从产品表中求出各产品的平均价格。
		select avg(prod_price) as agv_price from products;
	
	2、使用count()函数，从产品表中统计产品价格大于10美元的产品数量。
		select count(*) quantity from products where prod_price>10
	
	3、使用Max()函数，Min()函数，avg ()函数，统计products表中的产品数目，最高价格，最低价格和平均价格。
		select max(prod_num) prod_max, min(prod_num) prod_min,avg(prod_num) prod_avg from products;
	
	4、从产品表中，统计出各供应商提供的产品数量。
		select count(*) from product;
		
	5、从产品表中，统计供应产品的数量大于或等于3的供应商号及其供应数量。
		select count(prod_num) as quantity from products group by prod_num having count(prod_num)>=3;
		
	6、从orderitems（order_num，order_item，prod_id，quantity，item_price）表中，统计出订单金额大于50美元的订单号，并按订单金额排序。
		
	7、将查询结果写入实验报告中。
四、实验材料的提交与成绩评定
	1、本实验的实验报告一份（电子版或纸质版一份，具体形式由任课教师确定，格式参考学院统一实验报告）
	2、实验源程序一份，请表明题号（电子版）
	备注：做下一次实验之时提交上一次实验的材料，由各班学习委员以班为单位收集并上交任课教师。
	3、实验成绩总分为10分，由指导老师根据学生实验表现和实验材料进行评定，本门课程结束后实验平均成绩（实验总成绩/实验次数）按照10％的比例记入期末考试总成绩。

-------------------------------------------------------------------------------------------------------------------------------------------------------------
	实验六   使用子查询和联结表

一、实验目的
		1、掌握子查询的方法，学会使用多层子查询嵌套进行查询。
		2、掌握相关子查询的使用方法。
		3、掌握联结多个表的方法，学会使用联结进行查询。
二、实验理论基础及教材对应关系
	1、实验理论基础：
		（1）子查询
		（2）联结表；
	2、本实验内容主要对应于教材第14-15章的内容。
	三、实验内容与步骤
		1、已知表orderitems(order_num,order_item,prod_id,quantity,item_price)，
		表orders(order_num,order_date,cust_id)
		找出订购物品TNT2的顾客ID。
		
		#外部查詢根據內部查詢出的order_num找出在orders表中的cust_id
		select cust_id from orders where order_num=(
		#內部查詢先查詢出order——num
		select order_num from orderitems where order_num = 'TNT2');
		
	2、 已知表orders(order_num,order_date,cust_id)
		表customers(cust_id,cust_name,cust_address,cust_city,cust_state,cust_zip, cust_country,cust_contact, cust_email)
		查找客户的名字、状态，并每个客户的订单数进行统计。
		
		select cust_num,count(order_num) as order_count from order where cust_id in(
			select cust_id from customers
		);
		
		已知表vendors(vend_id,vend_name,vend_address,vend_city,vend_state, vend_zip,vend_country)
		表products(prod_id,vend_id,prod_name,prod_price,prod_desc)
		表orderitems(order_num,order_item,prod_id,quantity,item_price)
			
			3、从供应商和产品表中选出各产品的供应商名、产品名和产品的价格。
			select vend_name,prod_name,prod_price from vendors v outer join products p where v.vend_id=p.vend_id;
			
			4、找出订单号20005的产品名称、供应商名、产品价格和数量。
			select vend_name 供應商名稱,prod_name 產品名稱,prod_price 產品價格 quantity 產品數量 
			from vendors v outer join products p 
			where v.vend_id=p.vend_id and prod_id = 20005;
			
			5、将查询结果写入实验报告中。

四、实验材料的提交与成绩评定
	1、本实验的实验报告一份（电子版或纸质版一份，具体形式由任课教师确定，格式参考学院统一实验报告）
	2、实验源程序一份，请表明题号（电子版）
	备注：做下一次实验之时提交上一次实验的材料，由各班学习委员以班为单位收集并上交任课教师。
	3、实验成绩总分为10分，由指导老师根据学生实验表现和实验材料进行评定，本门课程结束后实验平均成绩（实验总成绩/实验次数）按照10％的比例记入期末考试总成绩。
	
-----------------------------------------------------------------------------------------------------------------------------------------------------
实验七   高级联结和组合查询

一、实验目的
	1、掌握使用表别名的使用方法；
	2、掌握左外联结、右外联结进行查询的方法；
	3、掌握组合查询的方法。
二、实验理论基础及教材对应关系
	1、实验理论基础：
	（1）高级联结
	（2）组合查询；
	2、本实验内容主要对应于教材第16-17章的内容。
三、实验内容与步骤
	1、使用表别名
		实验1、从顾客表customers(cust_id,cust_name,cust_address,cust_city,cust_state,cust_zip, cust_country,cust_contact, cust_email)、
		表orders (order_num,order_date,cust_id)、
		表orderitems (order_num,order_item,prod_id,quantity,item_price)中找出prod_id 为 'TNT2'的cust_name和 cust_contact。
		
	2、自联结
		实验2、从产品表products(prod_id,vend_id,prod_name,prod_price,prod_desc)中找出由供应商提供的prod_id是‘DTNTR’的所有prod_id和prod_name。
	
	3、内部联结和左外联结
		实验3、分别用内部联结和左外联结的方式实现下列查询：顾客表customers(cust_id,cust_name,cust_address,cust_city,cust_state,cust_zip, cust_country,cust_contact, cust_email)和
		表orders (order_num,order_date,cust_id)中
		选出各产品的cust_id和order_num。
		
	4、组合查询的使用
		实验4、从产品表products(prod_id,vend_id,prod_name,prod_price,prod_desc)中查询价格小于5的vend_id, prod_id, prod_price ，或者由供应商1001和1002所供应的vend_id, prod_id, prod_price 
	
	5、将查询结果写入实验报告中。
四、实验材料的提交与成绩评定
	1、本实验的实验报告一份（电子版或纸质版一份，具体形式由任课教师确定，格式参考学院统一实验报告）
	2、实验源程序一份，请表明题号（电子版）
	备注：做下一次实验之时提交上一次实验的材料，由各班学习委员以班为单位收集并上交任课教师。
	3、实验成绩总分为10分，由指导老师根据学生实验表现和实验材料进行评定，本门课程结束后实验平均成绩（实验总成绩/实验次数）按照10％的比例记入期末考试总成绩。
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
实验八   使用视图和存储过程

一、实验目的
	1、掌握创建视图的方法；
	2、掌握创建存储过程的方法；
	3、学会使用视图和存储过程。
二、实验理论基础及教材对应关系
	1、实验理论基础：
	（1）视图
	（2）存储过程；
	2、本实验内容主要对应于教材第21-22章的内容。
三、实验内容与步骤
	1、在customers, orders, orderitems表之间创建一个名称为productcustomers的视图，使得customers表的cust_id字段与orders的cust_id字段相等，orderitems表的order_num字段与 orders表的order_num字段相等。 
		???
	2、从新创建的productcustomers视图中找出prod_id 为 'TNT2'的cust_name和cust_contact。
		
	3、从新创建的productcustomers视图中找出prod_id 为 'OL1'的cust_name和cust_contact。
	
	4、从新创建的productcustomers视图中找出prod_id 为 ' ANV01'的cust_name。
	
	5、创建一个视图vendorlocations，将供应商vendors表中的顾客国家拼接在顾客名后面。
	
	6、创建一个视图customeremaillist，过滤掉customers表中顾客的电子邮箱是空的。
	
	7、给orderitems表创建一个视图orderitemsexpanded，字段名包括order_num, prod_id, quantity, item_price,和expanded_price，其中expanded_price=quantity*item_price。
	
	8、创建一个存储过程productpricing()，用来求products表中产品的平均价格。
	#创建存储过程
	create procedure if exists productpricing()
	declare @avg_price decimal(8,2)
	begin
		select avg(prod_price) into @avg_price from products;
	end ;
	
	create procedure if exists productpricing()
	begin
		select avg(prod_price) from products;
	end; 
	#调用存储过程productpricing()
	call productpricing();
	
	9、删除存储过程productpricing（）。
	#删除存储过程,如果存在的话，否则不加if exists的话，删除不存在存储过程会出错
		drop procedure if exists productpricing;
	
	10、创建一个存储过程productpricing2()，用来求products表中产品的的最低价、最高价和平均价格。
		create procedure productpricing2()
		begin
			select max(prod_price),min(prod_price),avg(prod_price) from products;
		end ;
		
	11、使用存储过程productpricing2()，查找出products表中产品的的最低价、最高价和平均价格。
		//调用存储过程productpricing2
		call productpricing();
	12、创建一个存储过程ordertotal()，输入orderitems表中order_num，输出orderitems表中的item_price*quantity计算结果值。
	
	13、使用存储过程ordertotal()，查找出orderitems表中order_num为20005的item_price*quantity计算结果值，查找出orderitems表中order_num为20009的item_price*quantity计算结果值。
	
	14、将查询结果写入实验报告中。
四、实验材料的提交与成绩评定
	1、本实验的实验报告一份（电子版或纸质版一份，具体形式由任课教师确定，格式参考学院统一实验报告）
	2、实验源程序一份，请表明题号（电子版）
	备注：做下一次实验之时提交上一次实验的材料，由各班学习委员以班为单位收集并上交任课教师。
	3、实验成绩总分为10分，由指导老师根据学生实验表现和实验材料进行评定，本门课程结束后实验平均成绩（实验总成绩/实验次数）按照10％的比例记入期末考试总成绩。
