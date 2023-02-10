use inventory;
create table users(
userId int primary key auto_increment,
firstName varchar(15),
lastName varchar(15),
email varchar(30) unique,
userName varchar(20),
userPassword varchar(20)
);
create table customers(
custId int primary key auto_increment,
custName varchar(20),
custAddress varchar(30),
custPhone int,
custAccNo int,
userId int,
constraint userId foreign key(userId) references users(userId)
);
create table categories(
catId int primary key auto_increment,
catName varchar(20)
);
create table products(
productId int primary key auto_increment,
catId int,
productName varchar(20),
productQty int,
retailPrice decimal(10, 2),
salePrice decimal(10, 2),
constraint catId foreign key (catId) references categories(catId)
);
create table orders(
orderId int primary key auto_increment,
custId int,
orderDate date,
profit decimal(10,2),
constraint custId_f foreign key(custId) references customers (custId));
create table sales(
saleNo int primary key auto_increment,
profit decimal(10, 2),
produstSaleDate date
);
create table order_product(
orderId int,
productId int,
constraint orderId foreign key (orderId) references orders(orderId),
constraint productId foreign key (productId) references products(productId),
primary key(orderId, productId)
);
create table Cust_prod (
custId int,
prodId int,
pQauantity int,
pAmount decimal(10,2),
constraint fk_cust foreign key(custId) references customers (custId),
constraint fk_prdo foreign key (prodId) references products (productId),
primary key(custId,prodId)
);
create table payment(
paymentNo int auto_increment,
orderId int,
paymentAmount decimal(10, 2),
accNo int,
paymentDate date,
remainingAmount int,
constraint order_Id foreign key (orderId) references orders(orderId),
primary key(paymentNo, orderId)
);
create table chart(
cMonth varchar(12) primary key,
cProfit decimal(10,2)
);
