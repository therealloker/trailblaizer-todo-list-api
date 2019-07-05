# JSON API Doc

This api is implemented according to the JSON API spec.

# Group Projects


## Projects [/projects]


### List [GET /api/projects]


+ Request response projects success
**GET**&nbsp;&nbsp;`/api/projects`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1NjI0OTgwNTJ9.HbSMM3XJrHbMFXpjHq-fmh0ckd2jZa-LjDgKODoXpTg
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
                    "name": "vitae"
                  },
                  "links": {
                    "self": "/api/projects/1"
                  }
                },
                {
                  "id": "2",
                  "type": "projects",
                  "attributes": {
                    "name": "id"
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
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyLCJleHAiOjE1NjI0OTgwNTJ9.AAs7MYd28Stid0HJisvviebQr2xzZby6QEIF4q8JfaY
            Content-Type: application/json

    + Body

            {
              "name": "suscipit"
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
                  "name": "suscipit"
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
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjozLCJleHAiOjE1NjI0OTgwNTJ9.UC4sSepjjElyszS7m2FmpJxuSYOdYPDXut7skwvl_Q0
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
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo0LCJleHAiOjE1NjI0OTgwNTJ9.fBJXkfcsaclZTo-uUwZ3lqnaACVgexml2yBjeZeuIag
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
                  "name": "fugit"
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
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo1LCJleHAiOjE1NjI0OTgwNTJ9.jjg16W_14fsoiXuhmUriMI7wL-WBfXyaS0SbAJtg_jI
            Content-Type: application/json

    + Body

            {
              "name": "molestiae"
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
                  "name": "molestiae"
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
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo2LCJleHAiOjE1NjI0OTgwNTJ9.no2rPy6JUnXg3iKXVXOxWnnDlj-OHLX9TPJqx2fCvNk
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
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo3LCJleHAiOjE1NjI0OTgwNTJ9.P5kXDWSRtfz87jveDVMgpEjpQTKNLUPClua1HHM37F8
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
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo4LCJleHAiOjE1NjI0OTgwNTJ9.99xlF5-GVRIo59gBhnN3AK-k6mHfT2v85fyQzMj2alI
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
                    "name": "et"
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
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo5LCJleHAiOjE1NjI0OTgwNTJ9.gj6EmJA5Lw7mlDMr0PldXl_aSrI0DGjMTiPVn-nh4Fk
            Content-Type: application/json

    + Body

            {
              "name": "quia"
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
                  "name": "quia"
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
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMCwiZXhwIjoxNTYyNDk4MDUyfQ.HfWt48DHyfwjYW0uRJtWWGOIuxsigxhBw5K7lqeohPM
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
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMSwiZXhwIjoxNTYyNDk4MDUyfQ.UZboz3JgFOrM-2xMQ7XOIvPZ5UiyFt7bWAsPEu4BF8U
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
                  "name": "in"
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
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMiwiZXhwIjoxNTYyNDk4MDUyfQ.f-yLiTj8oB7WInY2C0lD4epttW4VHBIEINgvz-yrEh8
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
                "type": "tasks",
                "attributes": {
                  "name": "expedita"
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
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMywiZXhwIjoxNTYyNDk4MDUyfQ.twZka444jWAWdtdkc3faV_HxnHkiXiNd0JrlxmGMnB8
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
              "email": "test-email15@email.com",
              "password": "Password1",
              "password_confirmation": "Password1"
            }

+ Response 201

    + Headers

            Content-Type: application/vnd.api+json

    + Body

            {
              "data": {
                "id": "14",
                "type": "users",
                "attributes": {
                  "email": "test-email15@email.com"
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
              "email": "test-email18@email.com",
              "password": "Password1"
            }

+ Response 200

    + Headers

            Content-Type: application/vnd.api+json

    + Body

            {
              "data": {
                "id": "15",
                "type": "users",
                "attributes": {
                  "email": "test-email18@email.com"
                }
              },
              "meta": {
                "token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxNSwiZXhwIjoxNTYyNDk4MDUyfQ.3B26Xti8rIsAb-FcVYu6m5nhsehHiPzrrS2wkN6osRw"
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
