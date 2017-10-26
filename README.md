# candy-shop-delivery

Simple candy shop delivery webapp made with Ruby. Using RoR as MVC framework, DBMS PostgreSQL in the persistence layer and in the front, I'm using Bulma, a recent and beautiful css framework.

Before diving into the sections below, be sure you have the following applications instaled in your computer:
- Ruby 2.3.3
- Ruby On Rails 5.1.4
- Git
- PostgreSQL

### Downloading the project

In order to download this project, chose a folder which you want to download this project, open your terminal in that folder and run the command `git clone https://github.com/pedroviniv/candy-shop-delivery.git`.

### Configuration and Deployment

Before deploying this app, you should take a look at config/database.yml file. Once I'm using PostgreSQL, you should create a new database in the PostgreSQL with the name "candy-shop-delivery" and after that, configure some attributes in the file mentioned before. The attributes you must configure is: username, password and host. Put these information accordingly to the PostgreSQL installed in your host.

Once the configuration is done, you should open your terminal and run the command "rails s" to deploy the webapp and expose it through the port 3000.

If the steps described above went fine, you'll be able to access the application through the address http://localhost:3000/orders.
