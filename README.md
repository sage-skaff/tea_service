<h1 align="center">Tea Subscription Service</h1>
REST api for a tea subscription service that allows customers to purchase subscriptions to their favorite teas.

## Install

### Clone the repository

```shell
git clone
cd lunch_and_learn
```

### Check your Ruby version

```shell
ruby -v
```

The ouput should start with something like `ruby 2.7.2`

If not, install the correct ruby version using [rbenv](https://github.com/rbenv/rbenv):

```shell
rbenv install 2.7.2
```

### Install dependencies

Using [Bundler](https://github.com/bundler/bundler)

```shell
bundle install
```

### Initialize the database

```shell
rails db:{drop,create,migrate,seed}
```

### Run the Test Suite

```shell
bundle exec rspec
```
### Start the Server

```shell
rails s
```

You should now be able to hit the API endpoints using Postman or a similar tool.

Default host is `http://localhost:3000`

## Endpoints
### Subscribe a Customer to a Tea Subscription
### Cancel a Customer's Tea Subscription
### View Customer's Subscriptions (active and cancelled)