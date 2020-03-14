# The Problem

A company that has a website about movies wants to provide its customers and users an API to
query their database, as well as provide the trusted company users the ability to update or
create new records.
In order to complete this, you must create a RESTful interface that will provide access to the
company’s database.

# Models

Here’s a description of the company database models.
You can add any extra field/relationship but the ones described here are mandatory.

# Person

- Id
- Last Name
- First Name
- Aliases
- Movies as Actor/Actress
- Movies as Director
- Movies as Producer

# Movie

- Id
- Title
- Release Year
- Casting (Actors + Actresses)
- Directors
- Producers

# Requirements

1. Provide a REST API to access movies and persons models.
2. Safe methods are publicly available, no authentication is required.
3. Unsafe methods are only available to authenticated users.
4. Movie documents must include references or full documents to persons in their different
roles.
5. Person documents must include references or full documents to movies in the different
roles the Person has.
6. Movie documents must include the Release Year in roman numerals. This field should
not be stored in the DB, just calculated on the fly.


# Solution

# UML Diagram

```
+-----+   +--------------+   +-------+
|Movie+---+Participation +---+Person |
+-----+   +--------------+   +-------+
                |
                |
            +------+
            | Role |
            +------+
```

1. CRUD endpoints for movies
```
  POST /api/v1/movies
  GET  /api/v1/movies/:id
  PUT  /api/v1/movies/:id
  DEL  /api/v1/movies/id
  GET  /api/v1/movies
```

CRUD endpoints for people
```
  POST /api/v1/people
  GET  /api/v1/people/:id
  PUT  /api/v1/people/:id
  DEL  /api/v1/people/id
  GET  /api/v1/people
```

CRUD endpoints for roles
```
  POST /api/v1/roles
  GET  /api/v1/roles/:id
  PUT  /api/v1/roles/:id
  DEL  /api/v1/roles/id
  GET  /api/v1/roles
```

CRUD endpoints for participations
```
  POST /api/v1/participations
  GET  /api/v1/participations/:id
  PUT  /api/v1/participations/:id
  DEL  /api/v1/participations/id
  GET  /api/v1/participations
```

4. Movie documents must include references or full documents to persons in their different
roles.
```
  GET api/v1/movies/:id/people
```

5. Person documents must include references or full documents to movies in the different
roles the Person has.
```
  GET api/v1/people/:id/movies
```

# Installation

- Install dependencies:
```
bundle install
```
- Setup database:
```
rails db:setup
rails db:migrate
```
- Run local server:
```
rails server
```
Runs the app in the development mode.

Open http://localhost:3000 to view it in the browser.