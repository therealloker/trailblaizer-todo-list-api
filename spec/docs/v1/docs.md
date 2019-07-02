# JSON API Doc

This api is implemented according to the JSON API spec.

# Group Projects


## Projects [/projects]


### List [GET /api/projects]


+ Request gets projects success
**GET**&nbsp;&nbsp;`/api/projects`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1NjIxOTUwNTR9.p5J1jv1zvEvAgwXlQ4v9yQSd8MvJp1x_aEWE1DL8apI
            Content-Type: application/json

+ Response 200

    + Headers

            Content-Type: application/vnd.api+json

    + Body

            {
              "data": [
                {
                  "id": "1",
                  "type": "projects",
                  "attributes": {
                    "name": "aliquam"
                  },
                  "links": {
                    "self": "/api/projects/1"
                  }
                },
                {
                  "id": "2",
                  "type": "projects",
                  "attributes": {
                    "name": "natus"
                  },
                  "links": {
                    "self": "/api/projects/2"
                  }
                }
              ],
              "jsonapi": {
                "version": "1.0"
              }
            }

### Create [POST /api/projects]


+ Request project create success
**POST**&nbsp;&nbsp;`/api/projects`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyLCJleHAiOjE1NjIxOTUwNTR9.ofHWpH5MTSDtsSYxf9lkMDjDZwFWmk_kSmuW7ncTRwo
            Content-Type: application/json

    + Body

            {
              "name": "placeat"
            }

+ Response 201

    + Headers

            Content-Type: application/vnd.api+json

    + Body

            {
              "data": {
                "id": "3",
                "type": "projects",
                "attributes": {
                  "name": "placeat"
                },
                "links": {
                  "self": "/api/projects/3"
                }
              },
              "jsonapi": {
                "version": "1.0"
              }
            }

+ Request creating fails
**POST**&nbsp;&nbsp;`/api/projects`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjozLCJleHAiOjE1NjIxOTUwNTR9.dKyPJmjvbUfiXgEcw2yqf8IIPJXfvc7_m0rfzyj-jYE
            Content-Type: application/json

    + Body

            {
              "name": ""
            }

+ Response 422

    + Headers

            Content-Type: application/vnd.api+json

    + Body

            {
              "errors": [
                {
                  "detail": "must be filled",
                  "source": {
                    "pointer": "/data/attributes/name"
                  }
                }
              ],
              "jsonapi": {
                "version": "1.0"
              }
            }

### Get record [GET /api/projects/{id}]

+ Parameters
    + id: `4` (number, required)

+ Request gets a project success
**GET**&nbsp;&nbsp;`/api/projects/4`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo0LCJleHAiOjE1NjIxOTUwNTR9.rkQXPTlAAvD4LkYvkfBZsYg2Zc2fhk7nDCqC7BsqT8w
            Content-Type: application/json

+ Response 200

    + Headers

            Content-Type: application/vnd.api+json

    + Body

            {
              "data": {
                "id": "4",
                "type": "projects",
                "attributes": {
                  "name": "quam"
                },
                "relationships": {
                  "tasks": {
                    "links": {
                      "related": "/api/projects/4/tasks"
                    }
                  }
                },
                "links": {
                  "self": "/api/projects/4"
                }
              },
              "jsonapi": {
                "version": "1.0"
              }
            }

### Update [PATCH /api/projects/{id}]

+ Parameters
    + id: `5` (number, required)

+ Request project update success
**PATCH**&nbsp;&nbsp;`/api/projects/5`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo1LCJleHAiOjE1NjIxOTUwNTR9.oN2Q6MLb5hcRp9iu2nsEzxsBEiPvQAZtwlLyDcw88AA
            Content-Type: application/json

    + Body

            {
              "name": "expedita"
            }

+ Response 200

    + Headers

            Content-Type: application/vnd.api+json

    + Body

            {
              "data": {
                "id": "5",
                "type": "projects",
                "attributes": {
                  "name": "expedita"
                },
                "relationships": {
                  "tasks": {
                    "links": {
                      "related": "/api/projects/5/tasks"
                    }
                  }
                },
                "links": {
                  "self": "/api/projects/5"
                }
              },
              "jsonapi": {
                "version": "1.0"
              }
            }

+ Request updating fails
**PATCH**&nbsp;&nbsp;`/api/projects/6`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo2LCJleHAiOjE1NjIxOTUwNTR9.VkkEhqUQ6DqxLtNYF-qV2-QP9pdWa1DoE2tP0VKPxwQ
            Content-Type: application/json

    + Body

            {
              "name": ""
            }

+ Response 422

    + Headers

            Content-Type: application/vnd.api+json

    + Body

            {
              "errors": [
                {
                  "detail": "must be filled",
                  "source": {
                    "pointer": "/data/attributes/name"
                  }
                }
              ],
              "jsonapi": {
                "version": "1.0"
              }
            }

### Delete [DELETE /api/projects/{id}]

+ Parameters
    + id: `7` (number, required)

+ Request project delete success
**DELETE**&nbsp;&nbsp;`/api/projects/7`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo3LCJleHAiOjE1NjIxOTUwNTR9.Dp_LHY54aifnWyXZrPhirVoLfY9wWkChz5c4r99wHBY
            Content-Type: application/json

+ Response 204

# Group Users


## Registration action [/users/registration]


### Sign Up [POST /api/users/registration]


+ Request sign up success
**POST**&nbsp;&nbsp;`/api/users/registration`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/json

    + Body

            {
              "email": "test-email9@email.com",
              "password": "Password1",
              "password_confirmation": "Password1"
            }

+ Response 201

    + Headers

            Content-Type: application/vnd.api+json

    + Body

            {
              "data": {
                "id": "8",
                "type": "users",
                "attributes": {
                  "email": "test-email9@email.com"
                }
              },
              "jsonapi": {
                "version": "1.0"
              }
            }

+ Request sign up fails
**POST**&nbsp;&nbsp;`/api/users/registration`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

+ Response 422

    + Headers

            Content-Type: application/vnd.api+json

    + Body

            {
              "errors": [
                {
                  "detail": "must be filled",
                  "source": {
                    "pointer": "/data/attributes/email"
                  }
                },
                {
                  "detail": "must be filled",
                  "source": {
                    "pointer": "/data/attributes/password"
                  }
                },
                {
                  "detail": "size cannot be less than 8",
                  "source": {
                    "pointer": "/data/attributes/password"
                  }
                }
              ],
              "jsonapi": {
                "version": "1.0"
              }
            }

## Login action [/users/login]


### Sign In [POST /api/users/login]


+ Request sign in success
**POST**&nbsp;&nbsp;`/api/users/login`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/json

    + Body

            {
              "email": "test-email12@email.com",
              "password": "Password1"
            }

+ Response 200

    + Headers

            Content-Type: application/vnd.api+json

    + Body

            {
              "data": {
                "id": "9",
                "type": "users",
                "attributes": {
                  "email": "test-email12@email.com"
                }
              },
              "meta": {
                "token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo5LCJleHAiOjE1NjIxOTUwNTR9.Qy05XjNQIB0-ndfox8d7cCsXtJrEHzMHFuJEr2E8630"
              },
              "jsonapi": {
                "version": "1.0"
              }
            }

+ Request login fails
**POST**&nbsp;&nbsp;`/api/users/login`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/json

    + Body

            {
              "email": "buffalobill@mail.com",
              "password": "lambs123"
            }

+ Response 422

    + Headers

            Content-Type: application/vnd.api+json

    + Body

            {
              "errors": [
                {
                  "detail": "You shall not pass",
                  "source": {
                    "pointer": "/data/attributes/user"
                  }
                }
              ],
              "jsonapi": {
                "version": "1.0"
              }
            }
