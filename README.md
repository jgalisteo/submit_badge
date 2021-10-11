# Submit Badge to Chainpoint

Rails app to submit badge information to Chainpoint.

## Configuration

Ensure that you have ruby 3.0.2 and bundler installed, then:

```
bundle install
```

The next step is to setup the database:

```
bundle exec rails db:migrate
```

Finally, start development server:

```
bundle exec rails server
```

The app needs to connect to Chainpoint. The endpoint can be configured with the env variable
`CHAINPOINT_URL`:

```
CHAINPOINT_URL=<chainpoint-url> bundle exec rails server
```

## Tests

For running tests:

```
bundle exec rspec
```
