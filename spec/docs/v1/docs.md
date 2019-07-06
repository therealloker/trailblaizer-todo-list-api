# JSON API Doc

This api is implemented according to the JSON API spec.

# Group Tasks


## Tasks [/tasks]


### List [GET /api/tasks]


+ Request response success
**GET**&nbsp;&nbsp;`/api/tasks`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1NjI1NTk3Mzh9.P6jJ1XgaLHTFQaII45wDr_lavZ8QUZuGKX_qzv_8kXs
            Content-Type: application/json

+ Response 200

    + Headers

            Content-Type: application/vnd.api+json

    + Body

            {
              "data": [
                {
                  "id": "1",
                  "type": "tasks",
                  "attributes": {
                    "name": "et",
                    "done": false,
                    "important": false
                  },
                  "links": {
                    "self": "/api/tasks/1"
                  }
                },
                {
                  "id": "2",
                  "type": "tasks",
                  "attributes": {
                    "name": "omnis",
                    "done": false,
                    "important": false
                  },
                  "links": {
                    "self": "/api/tasks/2"
                  }
                }
              ],
              "jsonapi": {
                "version": "1.0"
              }
            }

### Create [POST /api/tasks]


+ Request response success
**POST**&nbsp;&nbsp;`/api/tasks`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyLCJleHAiOjE1NjI1NTk3Mzh9.o55jakX9vTwMd7r6Ad4U3K8hnSQ-9r1fM9xwCkLRlXM
            Content-Type: application/json

    + Body

            {
              "name": "libero",
              "done": false,
              "important": false
            }

+ Response 201

    + Headers

            Content-Type: application/vnd.api+json

    + Body

            {
              "data": {
                "id": "3",
                "type": "tasks",
                "attributes": {
                  "name": "libero",
                  "done": false,
                  "important": false
                },
                "links": {
                  "self": "/api/tasks/3"
                }
              },
              "jsonapi": {
                "version": "1.0"
              }
            }

+ Request creating fails
**POST**&nbsp;&nbsp;`/api/tasks`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjozLCJleHAiOjE1NjI1NTk3Mzl9.-wm-0XzX5KH3PUJjyfgMf1lemDIC_NqAxGy5x-zTyPw
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

### Get [GET /api/tasks/{id}]

+ Parameters
    + id: `4` (number, required)

+ Request response success
**GET**&nbsp;&nbsp;`/api/tasks/4`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo0LCJleHAiOjE1NjI1NTk3Mzl9.oJOioZX0vj17cAGxPSiSHaQXErDH-Dvn44XjuaRquho
            Content-Type: application/json

+ Response 200

    + Headers

            Content-Type: application/vnd.api+json

    + Body

            {
              "data": {
                "id": "4",
                "type": "tasks",
                "attributes": {
                  "name": "qui",
                  "done": false,
                  "important": false
                },
                "links": {
                  "self": "/api/tasks/4"
                }
              },
              "jsonapi": {
                "version": "1.0"
              }
            }

### Update [PATCH /api/tasks/{id}]

+ Parameters
    + id: `5` (number, required)

+ Request response success
**PATCH**&nbsp;&nbsp;`/api/tasks/5`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo1LCJleHAiOjE1NjI1NTk3Mzl9.eDTbRXRqtr7t_WgXMPheS1zzEBTbu7iGNYgIeRdDcD4
            Content-Type: application/json

    + Body

            {
              "name": "voluptatem",
              "done": false,
              "important": false
            }

+ Response 200

    + Headers

            Content-Type: application/vnd.api+json

    + Body

            {
              "data": {
                "id": "5",
                "type": "tasks",
                "attributes": {
                  "name": "voluptatem",
                  "done": false,
                  "important": false
                },
                "links": {
                  "self": "/api/tasks/5"
                }
              },
              "jsonapi": {
                "version": "1.0"
              }
            }

+ Request updating fails
**PATCH**&nbsp;&nbsp;`/api/tasks/6`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo2LCJleHAiOjE1NjI1NTk3Mzl9.60Q0Q-0X3dHL2fW0sgjulgryCZF69nwPEPp1LlCUdI8
            Content-Type: application/json

    + Body

            {
              "name": "",
              "done": "no"
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
                },
                {
                  "detail": "You are already have a task with such name",
                  "source": {
                    "pointer": "/data/attributes/name"
                  }
                }
              ],
              "jsonapi": {
                "version": "1.0"
              }
            }

### Delete [DELETE /api/tasks/{id}]

+ Parameters
    + id: `7` (number, required)

+ Request response success
**DELETE**&nbsp;&nbsp;`/api/tasks/7`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo3LCJleHAiOjE1NjI1NTk3Mzl9.8PWTrZExu6RehqLGXVslxj43MoNQcnQNwyZpYGKHafw
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
                "token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo5LCJleHAiOjE1NjI1NTk3Mzl9.muik_ewePN_KiAnQCgJNIvZtQukouWLtYKezolki-6k"
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
