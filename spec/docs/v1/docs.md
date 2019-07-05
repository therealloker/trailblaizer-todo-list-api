# JSON API Doc

This api is implemented according to the JSON API spec.

# Group Projects


## Projects [/projects]


### List [GET /api/projects]


+ Request response projects success
**GET**&nbsp;&nbsp;`/api/projects`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1NjI0OTkzMTh9.f2iRQKEqDd2yQUiNIsEbyVjEVFDo4fAIJOM00MSAQWc
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
                    "name": "est"
                  },
                  "links": {
                    "self": "/api/projects/1"
                  }
                },
                {
                  "id": "2",
                  "type": "projects",
                  "attributes": {
                    "name": "sapiente"
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
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyLCJleHAiOjE1NjI0OTkzMTh9.0fpg6DVdwvMd8LxgmM3qQRhS5XciPPj_Axrqy83Hp8w
            Content-Type: application/json

    + Body

            {
              "name": "distinctio"
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
                  "name": "distinctio"
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
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjozLCJleHAiOjE1NjI0OTkzMTh9.QGEl6j9paTROUv-AazTcSIKWUDpOKWD-aOp7-O77pvc
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
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo0LCJleHAiOjE1NjI0OTkzMTh9.ow-JC0jpKezAFITfucpUcod5s_EsI4i11cSOb4OLpS4
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
                  "name": "quidem"
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
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo1LCJleHAiOjE1NjI0OTkzMTh9.DsfdwVDZb3BKtP1r6xdvsU22hAtoyppldIreU-afg5o
            Content-Type: application/json

    + Body

            {
              "name": "non"
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
                  "name": "non"
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
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo2LCJleHAiOjE1NjI0OTkzMTl9.0tky53Gl-VgxwleSKozKEGzXPqjTlrI2LErmnX0drzg
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
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo3LCJleHAiOjE1NjI0OTkzMTl9.Bh2cK3ew4J32DA6v2BZmHbLAPRzNOM6jk86bHK1vQeU
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
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo4LCJleHAiOjE1NjI0OTkzMTl9.TQcD2Y95raFKu5tcsezT9RBSsNv3-JSKUd9XjXXq14U
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
                    "name": "voluptatem"
                  },
                  "links": {
                    "self": "/api/tasks/1"
                  }
                },
                {
                  "id": "2",
                  "type": "tasks",
                  "attributes": {
                    "name": "error"
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
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo5LCJleHAiOjE1NjI0OTkzMTl9.Tkd27Y54TH9Hx3PgOiwNvnw7AkyM_rkJ6lkv5kDbpPA
            Content-Type: application/json

    + Body

            {
              "name": "ut"
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
                  "name": "ut"
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
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMCwiZXhwIjoxNTYyNDk5MzE5fQ.Ak0YTrsyVhQPDO7a31ubzqdMfOYdaEYRKMJuJ6ZssrA
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
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMSwiZXhwIjoxNTYyNDk5MzE5fQ.JUdMNmjEXRkZLjcKv5gRv7FD6gCMo_Barn8x43R72FY
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
                  "name": "eos"
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

### Update [PATCH /api/tasks/{id}]

+ Parameters
    + id: `5` (number, required)

+ Request task update success
**PATCH**&nbsp;&nbsp;`/api/tasks/5`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMiwiZXhwIjoxNTYyNDk5MzE5fQ.TQ3H3ov7qdzM0HskIzN_QqGBv0CLhab64F8-mIRMTxw
            Content-Type: application/json

    + Body

            {
              "name": "culpa"
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
                  "name": "culpa"
                },
                "relationships": {
                  "project": {
                    "links": {
                      "self": "/api/projects/12"
                    }
                  }
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
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMywiZXhwIjoxNTYyNDk5MzE5fQ.njDCpv3eY2lViFUocDNDKVjeGh2ASI7LkJ3_Iocdhqw
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

### Delete [DELETE /api/tasks/{id}]

+ Parameters
    + id: `7` (number, required)

+ Request project delete success
**DELETE**&nbsp;&nbsp;`/api/tasks/7`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxNCwiZXhwIjoxNTYyNDk5MzE5fQ.R1QFSWSzH3lKWv4ZLD5zZ_WWX3oJoLmeyfngbDygWvc
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
              "email": "test-email16@email.com",
              "password": "Password1",
              "password_confirmation": "Password1"
            }

+ Response 201

    + Headers

            Content-Type: application/vnd.api+json

    + Body

            {
              "data": {
                "id": "15",
                "type": "users",
                "attributes": {
                  "email": "test-email16@email.com"
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
              "email": "test-email19@email.com",
              "password": "Password1"
            }

+ Response 200

    + Headers

            Content-Type: application/vnd.api+json

    + Body

            {
              "data": {
                "id": "16",
                "type": "users",
                "attributes": {
                  "email": "test-email19@email.com"
                }
              },
              "meta": {
                "token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxNiwiZXhwIjoxNTYyNDk5MzE5fQ.nTjHAzD0mXHnDjJ4qqgmGD8holDVVXTbJGNhTGFoO_M"
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
