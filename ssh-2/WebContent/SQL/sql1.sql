#查看已经存在的数据库
show databases;
#选择要操作的数据库
use databases;
#显示的mysql数据库中的表
show tables;
#查看表host中的列
show columns from host
#（1）查询单列数据
简单的查询：（1）查询单列数据
    选择数据库：use exam1;
    输入命令：
    select product_name
	from products;
	
（2）查询多列数据:
  输入命令：
  SELECT prod_id, prod_name, prod_price 
   FROM  products;
   
（3）查找所有列
输入命令：  
SELECT * 
FROM products; 

（4）使用DISTINCT消除重复项
输入命令：  
SELECT DISTINCT  vend_id 
FROM  products; 
回车后可看到如下的结果：

（5）限制输出的行数
输入命令：
SELECT  prod_name 
FROM products 
LIMIT 2,3; 

