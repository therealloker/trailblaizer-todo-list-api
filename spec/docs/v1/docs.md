# JSON API Doc

This api is implemented according to the JSON API spec.

# Group Projects


## Projects [/projects]


### List [GET /api/projects]


+ Request response projects success
**GET**&nbsp;&nbsp;`/api/projects`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1NjIzODI2NDh9.KjLuZwRbF0TL5zDRzQDhUxjjpovE6L0xK9ju9AZV5dQ
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
                    "name": "id"
                  },
                  "links": {
                    "self": "/api/projects/1"
                  }
                },
                {
                  "id": "2",
                  "type": "projects",
                  "attributes": {
                    "name": "esse"
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
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyLCJleHAiOjE1NjIzODI2NDh9.rLD5lCg4livNPmM_DdwnajQdXT8x44rmqc5hQ1AYPqY
            Content-Type: application/json

    + Body

            {
              "name": "tenetur"
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
                  "name": "tenetur"
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
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjozLCJleHAiOjE1NjIzODI2NDh9.4htEzddaqNb-00UcYew1N4jdxNp3yJHKQQHVgg7H-SY
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
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo0LCJleHAiOjE1NjIzODI2NDh9.VGwu9dFLP9eYhIMArj9E6qixa_ygIeZV9vaurJd8CvQ
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
                  "name": "dolorum"
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
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo1LCJleHAiOjE1NjIzODI2NDh9.gLRuL-58MDY55-LwDhfYK7ovq6kyoX6AohQwScH6xOw
            Content-Type: application/json

    + Body

            {
              "name": "saepe"
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
                  "name": "saepe"
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
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo2LCJleHAiOjE1NjIzODI2NDh9.7rm3sBbcvji9IY5mjACXjKtGu_noOLCw5WWagrtqpmQ
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
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo3LCJleHAiOjE1NjIzODI2NDh9.0JrtCQHCtg01EoIRfnsEeeIvKZZ4StWEh2a4yRmA-0I
            Content-Type: application/json

+ Response 204

# Group Tasks


## Tasks [/projects/:id/tasks]


### List [GET /api/projects/{project_id}/tasks]

+ Parameters
    + project_id: `8` (number, required)

+ Request response tasks success
**GET**&nbsp;&nbsp;`/api/projects/8/tasks`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo4LCJleHAiOjE1NjIzODI2NDh9.FmLZHOc0yWfA-63Cn9qMhVTDa6_xilu_6pkG6p8OXb0
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
                    "name": "minima"
                  },
                  "links": {
                    "self": "/api/tasks/1"
                  }
                },
                {
                  "id": "2",
                  "type": "tasks",
                  "attributes": {
                    "name": "quibusdam"
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

### Create [POST /api/projects/{project_id}/tasks]

+ Parameters
    + project_id: `9` (number, required)

+ Request task created success
**POST**&nbsp;&nbsp;`/api/projects/9/tasks`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo5LCJleHAiOjE1NjIzODI2NDh9.ud4hQoeanDE_qQqu4imXgg6vB3qSDOvveJnw-QfHNVw
            Content-Type: application/json

    + Body

            {
              "name": "modi"
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
                  "name": "modi"
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
**POST**&nbsp;&nbsp;`/api/projects/10/tasks`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMCwiZXhwIjoxNTYyMzgyNjQ4fQ.6pyUvAYalJZ3MUbXFMSTJUGUOACSLu0It3yP7ffupnk
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

+ Request gets task success
**GET**&nbsp;&nbsp;`/api/tasks/4`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMSwiZXhwIjoxNTYyMzgyNjQ4fQ.V4uKgm21w02c48RpriVFp7cmqdIdVEfMKf3A6BvYeM4
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
                  "name": "architecto"
                },
                "relationships": {
                  "project": {
                    "links": {
                      "self": "/api/projects/11"
                    }
                  }
                },
                "links": {
                  "self": "/api/tasks/4"
                }
              },
              "jsonapi": {
                "version": "1.0"
              }
            }

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
              "email": "test-email13@email.com",
              "password": "Password1",
              "password_confirmation": "Password1"
            }

+ Response 201

    + Headers

            Content-Type: application/vnd.api+json

    + Body

            {
              "data": {
                "id": "12",
                "type": "users",
                "attributes": {
                  "email": "test-email13@email.com"
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
              "email": "test-email16@email.com",
              "password": "Password1"
            }

+ Response 200

    + Headers

            Content-Type: application/vnd.api+json

    + Body

            {
              "data": {
                "id": "13",
                "type": "users",
                "attributes": {
                  "email": "test-email16@email.com"
                }
              },
              "meta": {
                "token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMywiZXhwIjoxNTYyMzgyNjQ4fQ.d1Dnr25RCJRcGUOlu-NgXJuU7GFIVRIfOnnJz6cHkXI"
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
