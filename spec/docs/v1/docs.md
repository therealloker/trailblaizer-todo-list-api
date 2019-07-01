# JSON API Doc

This api is implemented according to the JSON API spec.

# Group Projects


## Projects [/projects]


### Create [POST /api/projects]


+ Request project create success
**POST**&nbsp;&nbsp;`/api/projects`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1NjIxNDQ3MTF9.Kco0LNOtuj0ZbEtrfDw0bd4LVmz9mdpkHBDx9UHI6PI
            Content-Type: application/json

    + Body

            {
              "name": "aperiam",
              "user": null
            }

+ Response 201

    + Headers

            Content-Type: application/vnd.api+json

    + Body

            {
              "data": {
                "id": "1",
                "type": "projects",
                "attributes": {
                  "name": "aperiam"
                },
                "links": {
                  "self": "/api/projects/1"
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
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyLCJleHAiOjE1NjIxNDQ3MTF9.NiX8N2T9ys93kOpCKwx4n9Gn1hZAUan2jRtKFORADPY
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
              "email": "test-email4@email.com",
              "password": "Password1",
              "password_confirmation": "Password1"
            }

+ Response 201

    + Headers

            Content-Type: application/vnd.api+json

    + Body

            {
              "data": {
                "id": "3",
                "type": "users",
                "attributes": {
                  "email": "test-email4@email.com"
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
              "email": "test-email7@email.com",
              "password": "Password1"
            }

+ Response 200

    + Headers

            Content-Type: application/vnd.api+json

    + Body

            {
              "data": {
                "id": "4",
                "type": "users",
                "attributes": {
                  "email": "test-email7@email.com"
                }
              },
              "meta": {
                "token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo0LCJleHAiOjE1NjIxNDQ3MTF9.yr21jj8jL6Vsez7OASiROWrNuuJgJXJ-SwW-oQMUXA0"
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
