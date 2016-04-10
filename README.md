## Faker ->> REST API

> Sinatra app to create REST, SMS and Slack Command endpoints for Ruby's [Faker](http://github.com/stympy/faker) Module developed to learn API versioning and gateways

### API Call

> The 'API' methods takes two parameters: `<faker-class-name>` and `faker-class-method`. Example call:

```
http://rubyfaker.herokuapp.com/api/name/name
```

### Response

> The response consists of two variables: `result` and `data` as shown below:

``` javascript
{
result: "success",
data: "Dell Hilpert MD"
}
```

```javascript
{
result: "error",
data: "API available at '/api/<faker-class-name>/<faker-class-method'. This API does not support method parameters currently."
}
```

_The version number in the response link reflects the Faker Module Version_
