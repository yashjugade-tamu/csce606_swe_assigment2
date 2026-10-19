# Rotten Potatoes

A small Rails movie catalog built for Assignment 2. It provides create, read, update, and delete pages for movies; a sortable index; and a hand-written responsive design.

## Requirements

- Ruby 3.3.6
- Bundler
- SQLite for local development
- PostgreSQL for production

## Run locally

```sh
bundle install
bin/rails db:prepare
bin/rails db:seed
bin/rails server
```

Open <http://localhost:3000>. The seed task is safe to run more than once: it updates the matching movie title rather than adding another copy.

Sort the collection by selecting Title, Rating, or Release date. Select the active heading again to reverse its direction. The sort choice is kept in the session as you view, edit, or add movies.

## Deploy on Render

This repository includes a `render.yaml` Blueprint for a free Ruby web service and a free Render Postgres database. Push the project to a Git provider, then create a Blueprint in Render using that repository. Render will install gems, precompile assets, apply migrations, seed the database, and start Puma.

Render's free web services spin down after inactivity, so the first request after a quiet period can take about a minute. Its free Postgres database expires 30 days after creation; upgrade it before expiration if the stored movie data must be retained. See [Render's free instance limits](https://render.com/docs/free) and [Rails 7 deployment guide](https://render.com/docs/deploy-rails-6-7).

## Assignment features

- Movies have a title, rating, description, release date, and timestamps.
- CRUD routes and forms include validation feedback.
- The index table has semantic header, body, and footer sections and omits descriptions.
- Title, rating, and release date sort in both directions. The active column is highlighted, and a text/screen-reader cue announces the direction.
- Sort state persists in the Rails session while navigating away from and back to the index.
- The seed file includes ten movies and is idempotent.
- No CSS framework is used.
