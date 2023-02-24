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
### Register a Customer
- Request
```
POST /api/v1/customers
Content-Type: application/json
Accept: application/json

{
    "first_name": "Ahsoka",
    "last_name": "Tano",
    "email": "atano@jedi.com",
    "address": "Jedi Temple, Coruscant"
}
```
- Response
```json
{
    "data": {
        "id": "1",
        "type": "customer",
        "attributes": {
            "first_name": "Ahsoka",
            "last_name": "Tano",
            "email": "atano@jedi.com",
            "address": "Jedi Temple, Coruscant"
        }
    }
}
```
### Subscribe a Customer to a Tea Subscription
- Request
```
POST /api/v1/customers/1/subscription
Content-Type: application/json
Accept: application/json

{
    "title": "Ashwagandha",
    "price": 20,
    "status": "active",
    "tea_id": 3
}
```
- Response
```json
{
    "data": {
        "id": "3",
        "type": "subscription",
        "attributes": {
            "title": "Ashwagandha",
            "status": "active",
            "price": 20,
            "customer_id": 1,
            "tea_id": 3
        }
    }
}
```

### Cancel a Customer's Tea Subscription
- Request
```
GET /api/v1/customers/1/subscriptions/7/?update=cancelled
Content-Type: application/json
Accept: application/json
```
- Response
```json
{
    "data": {
        "id": "3",
        "type": "subscription",
        "attributes": {
            "title": "Ashwagandha",
            "status": "cancelled",
            "price": 20,
            "customer_id": 1,
            "tea_id": 3
        }
    }
}
```

### View Customer's Subscriptions (active and cancelled)
- Request
```
GET /api/v1/customers/1/subscriptions
Content-Type: application/json
Accept: application/json
```
- Response
```json
{
    "data": [
        {
            "id": "1",
            "type": "subscription",
            "attributes": {
                "title": "Yerba Mate Blend",
                "status": "active",
                "price": 15,
                "customer_id": 2,
                "tea_id": 1
            }
        },
        {
            "id": "2",
            "type": "subscription",
            "attributes": {
                "title": "Green Tea",
                "status": "active",
                "price": 17,
                "customer_id": 2,
                "tea_id": 2
            }
        },
        {
            "id": "3",
            "type": "subscription",
            "attributes": {
                "title": "Ashwagandha",
                "status": "cancelled",
                "price": 20,
                "customer_id": 2,
                "tea_id": 3
            }
        }
    ]
}
```