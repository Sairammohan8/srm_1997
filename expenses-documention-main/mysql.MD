# MySQL

Developer has chosen the database MySQL. Hence, we are trying to install it up and configure it.

**Versions of the DB Software we will get context from the developer, Meaning we need to check with developer.**

Install MySQL Server 8.0.x

```
dnf install mysql-server -y
```

Start MySQL Service

```
systemctl enable mysqld
```
```
systemctl start mysqld
```

Next, We need to change the default root password in order to start using the database service. Use password ExpenseApp@1 or any other as per our choice.

```
mysql_secure_installation --set-root-pass ExpenseApp@1
```

## Verification

We can check data by using client package called mysql.

Usually command to connect mysql server is

```
mysql -h <host-address> -u root -p<password>
```

But if our client and server both are in a single server, we can simply issue.

```
mysql
```

Once we got mysql prompt, we can use below command to check schemas/databases exist.

```
show databases;
```

Once we are in particular schema, we can get the list of tables.

```
show tables;
```

We can get entries of a table using

```
select * from <table_name>;
```