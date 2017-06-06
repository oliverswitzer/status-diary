## Running the app

**Database setup**
```
$ brew install postgres
$ brew services start postgres
```

Create databases and grant privileges:
```
$ createuser postgres
$ createdb StatusDiary_dev
$ createdb StatusDiary_test

$ psql -d template1
> \c StoryDiary_test
> GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO postgres;
> \c StoryDiary_dev
> GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO postgres;
```

**Install dependencies for each gem**

```
$ cd status_diary
$ bundle install

$ cd ../plugins/api
$ bundle install

$ cd ../plugins/persistence
$ bundle install
```

**Running the tests**

To run all tests at once

```
$ rake
```

Or to run individually, within each package `plugins/api`, `plugins/persistence` or `status_diary`
run:

```
bundle exec rspec
```
