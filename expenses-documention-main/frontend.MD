# Frontend

Install Nginx
```
dnf install nginx -y 
```
Enable nginx
```
systemctl enable nginx
```
Start nginx
```
systemctl start nginx
```

**Try to access the service once over the browser and ensure we get some default content**

We need to remove the default content that web server is serving.
```
rm -rf /usr/share/nginx/html/*
```

To download the frontend content
```
curl -o /tmp/frontend.zip https://expense-builds.s3.us-east-1.amazonaws.com/expense-frontend-v2.zip
```
Extract the frontend content to "/usr/share/nginx/html"
```
cd /usr/share/nginx/html
```
```
Extract in "/usr/share/nginx/html"
unzip /tmp/frontend.zip 
```

**Try to access the nginx service once more over the browser and ensure we get expense content.**

We need to create Nginx Reverse Proxy Configuration.
```
vim /etc/nginx/default.d/expense.conf
```
Add the following content for Reverse Proxy Configuration
```
proxy_http_version 1.1;

location /api/ { proxy_pass http://localhost:8080/; }

location /health {
  stub_status on;
  access_log off;
}
```

**Ensure we replace the localhost with the actual ip address of backend component server. Word localhost is just used to avoid the failures on the Nginx Server.**
-----
We can use Nginx server as load-baancer

Modify the /etc/nginx/nginx.conf

http {
  upstream backend {
    server <IP1>;
    server <IP2>;
    .
    .
    .
    server <IPn>;
  }
}

and modify the Reverse Proxy Configuration vim /etc/nginx/default.d/expense.conf
```
proxy_http_version 1.1;

location /api/ { proxy_pass http://backend:8080/; }

location /health {
  stub_status on;
  access_log off;
}
------
```
Restart Nginx Service to load the changes of the configuration.

```
systemctl restart nginx
```