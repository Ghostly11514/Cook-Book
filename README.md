# README

Install guide for Ruby, Rails, and Postgres DB altogether: https://gorails.com/setup/ubuntu/21.04
(If you follow this guide change postgresql-11 to postgresql when installing PostgreSQL)

Requirements:
* rails version 6.1.3.1
* ruby version 3.0.1p64
* postgres version 12.6
* yarn version 1.22.5
* gem version 3.2.15
* bundle version 2.2.16

Steps to start application:
1. Install all required dependencies listed above in Requirements.
	1. If you have issues installing gem pg 1.2.3 see this post: https://stackoverflow.com/questions/7228798/why-isnt-bundle-install-allowing-for-the-pg-gem-to-fully-install
3. bundle install
4. yarn install
5. create postgres user with these steps:
	1. sudo -u postgres createuser {DB user account name} -s
	2. sudo -u postgres psql
	3. postgres=# {enter in password for account then hit enter prompt should change to postgres-#}
	4. You will also need to store the username and password as a environment variable (export COOK_BOOK_DATABASE_USERNAME={db username} & export COOK_BOOK_DATABASE_USERNAME={db password})
6. rake db:create
7. rails db:migrate
8. Now you can run the web app using rails s -b {Machine IP}
