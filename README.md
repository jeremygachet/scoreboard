# this is the Krakathon scoreboard V2



* Ruby 2.4.1
* Rails 5.2.1
* Posgres Sql

## Installation

- clone projet
- create db in postgres
- tweak config/database.yml

in cli :
- bundle
- rails db:migrate
- rails db:seed

Launch server : 
- rails s

access : http://localhost:3000/admin

Use your seeded user (you can see it in db/seed.rb)

## API :
Api are public and quit simple : 

### GET /api/v1/score
return the last published score wit all its details

RESPONSE : 
```json
{
    "id": 14,
    "name": null,
    "comment": null,
    "score": [
        {
            "id": 9,
            "created_at": "2018-10-26T10:44:31.648Z",
            "team": {
                "id": 1,
                "name": "team 42",
                "company": "",
                "created_at": "2018-10-26T06:35:17.853Z",
                "updated_at": "2018-10-26T10:45:25.523Z",
                "total_score": 1600
            },
            "exo": {
                "id": 1,
                "name": "Create a Krakhenboard",
                "comment": "",
                "points": 1500,
                "position": 1,
                "created_at": "2018-10-26T06:48:45.937Z",
                "updated_at": "2018-10-26T06:48:45.937Z"
            }
        },
        {
            "id": 10,
            "created_at": "2018-10-26T10:44:43.300Z",
            "team": {
                "id": 2,
                "name": "la new team",
                "company": "none",
                "created_at": "2018-10-26T10:08:57.162Z",
                "updated_at": "2018-10-26T10:08:57.162Z",
                "total_score": null
            },
            "exo": {
                "id": 2,
                "name": "Save a scoreboard",
                "comment": "",
                "points": 100,
                "position": 2,
                "created_at": "2018-10-26T10:04:31.315Z",
                "updated_at": "2018-10-26T10:04:31.315Z"
            }
        },
        {
            "id": 11,
            "created_at": "2018-10-26T10:45:25.440Z",
            "team": {
                "id": 1,
                "name": "team 42",
                "company": "",
                "created_at": "2018-10-26T06:35:17.853Z",
                "updated_at": "2018-10-26T10:45:25.523Z",
                "total_score": 1600
            },
            "exo": {
                "id": 2,
                "name": "Save a scoreboard",
                "comment": "",
                "points": 100,
                "position": 2,
                "created_at": "2018-10-26T10:04:31.315Z",
                "updated_at": "2018-10-26T10:04:31.315Z"
            }
        },
        {
            "id": 12,
            "created_at": "2018-10-26T10:51:43.158Z",
            "team": {
                "id": 2,
                "name": "la new team",
                "company": "none",
                "created_at": "2018-10-26T10:08:57.162Z",
                "updated_at": "2018-10-26T10:08:57.162Z",
                "total_score": null
            },
            "exo": {
                "id": 1,
                "name": "Create a Krakhenboard",
                "comment": "",
                "points": 1500,
                "position": 1,
                "created_at": "2018-10-26T06:48:45.937Z",
                "updated_at": "2018-10-26T06:48:45.937Z"
            }
        }
    ],
    "published": true,
    "created_at": "2018-10-26T10:51:43.168Z",
    "updated_at": "2018-10-26T10:51:47.612Z"
}
```






### GET /api/v1/scores_history
send all published scores 

RESPONSE : 
```json
[
    {
        "id": 14,
        "name": null,
        "comment": null,
        "score": [
            {
                "id": 9,
                "created_at": "2018-10-26T10:44:31.648Z",
                "team": {
                    "id": 1,
                    "name": "team 42",
                    "company": "",
                    "created_at": "2018-10-26T06:35:17.853Z",
                    "updated_at": "2018-10-26T10:45:25.523Z",
                    "total_score": 1600
                },
                "exo": {
                    "id": 1,
                    "name": "Create a Krakhenboard",
                    "comment": "",
                    "points": 1500,
                    "position": 1,
                    "created_at": "2018-10-26T06:48:45.937Z",
                    "updated_at": "2018-10-26T06:48:45.937Z"
                }
            },
            {
                "id": 10,
                "created_at": "2018-10-26T10:44:43.300Z",
                "team": {
                    "id": 2,
                    "name": "la new team",
                    "company": "none",
                    "created_at": "2018-10-26T10:08:57.162Z",
                    "updated_at": "2018-10-26T10:08:57.162Z",
                    "total_score": null
                },
                "exo": {
                    "id": 2,
                    "name": "Save a scoreboard",
                    "comment": "",
                    "points": 100,
                    "position": 2,
                    "created_at": "2018-10-26T10:04:31.315Z",
                    "updated_at": "2018-10-26T10:04:31.315Z"
                }
            },
            {
                "id": 11,
                "created_at": "2018-10-26T10:45:25.440Z",
                "team": {
                    "id": 1,
                    "name": "team 42",
                    "company": "",
                    "created_at": "2018-10-26T06:35:17.853Z",
                    "updated_at": "2018-10-26T10:45:25.523Z",
                    "total_score": 1600
                },
                "exo": {
                    "id": 2,
                    "name": "Save a scoreboard",
                    "comment": "",
                    "points": 100,
                    "position": 2,
                    "created_at": "2018-10-26T10:04:31.315Z",
                    "updated_at": "2018-10-26T10:04:31.315Z"
                }
            },
            {
                "id": 12,
                "created_at": "2018-10-26T10:51:43.158Z",
                "team": {
                    "id": 2,
                    "name": "la new team",
                    "company": "none",
                    "created_at": "2018-10-26T10:08:57.162Z",
                    "updated_at": "2018-10-26T10:08:57.162Z",
                    "total_score": null
                },
                "exo": {
                    "id": 1,
                    "name": "Create a Krakhenboard",
                    "comment": "",
                    "points": 1500,
                    "position": 1,
                    "created_at": "2018-10-26T06:48:45.937Z",
                    "updated_at": "2018-10-26T06:48:45.937Z"
                }
            }
        ],
        "published": true,
        "created_at": "2018-10-26T10:51:43.168Z",
        "updated_at": "2018-10-26T10:51:47.612Z"
    },
    {
        "id": 13,
        "name": null,
        "comment": null,
        "score": [
            {
                "id": 9,
                "created_at": "2018-10-26T10:44:31.648Z",
                "team": {
                    "id": 1,
                    "name": "team 42",
                    "company": "",
                    "created_at": "2018-10-26T06:35:17.853Z",
                    "updated_at": "2018-10-26T06:35:17.853Z",
                    "total_score": null
                },
                "exo": {
                    "id": 1,
                    "name": "Create a Krakhenboard",
                    "comment": "",
                    "points": 1500,
                    "position": 1,
                    "created_at": "2018-10-26T06:48:45.937Z",
                    "updated_at": "2018-10-26T06:48:45.937Z"
                }
            },
            {
                "id": 10,
                "created_at": "2018-10-26T10:44:43.300Z",
                "team": {
                    "id": 2,
                    "name": "la new team",
                    "company": "none",
                    "created_at": "2018-10-26T10:08:57.162Z",
                    "updated_at": "2018-10-26T10:08:57.162Z",
                    "total_score": null
                },
                "exo": {
                    "id": 2,
                    "name": "Save a scoreboard",
                    "comment": "",
                    "points": 100,
                    "position": 2,
                    "created_at": "2018-10-26T10:04:31.315Z",
                    "updated_at": "2018-10-26T10:04:31.315Z"
                }
            },
            {
                "id": 11,
                "created_at": "2018-10-26T10:45:25.440Z",
                "team": {
                    "id": 1,
                    "name": "team 42",
                    "company": "",
                    "created_at": "2018-10-26T06:35:17.853Z",
                    "updated_at": "2018-10-26T06:35:17.853Z",
                    "total_score": null
                },
                "exo": {
                    "id": 2,
                    "name": "Save a scoreboard",
                    "comment": "",
                    "points": 100,
                    "position": 2,
                    "created_at": "2018-10-26T10:04:31.315Z",
                    "updated_at": "2018-10-26T10:04:31.315Z"
                }
            }
        ],
        "published": true,
        "created_at": "2018-10-26T10:45:25.480Z",
        "updated_at": "2018-10-26T10:49:31.142Z"
    }
]
```





