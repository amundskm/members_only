# members_only

## The Odin Project: Authentication: Project 2

The project is to build an exclusive clubhouse where members can write
embarrassing posts about non-members. Inside the clubhouse, members can see who
the author of a post is but, outside, they can only see the story and wonder
who wrote it.

## Getting started

To get started with the app, clone the repo and then install the needed gems:
```
$ bundle install --without production
```

Next, migrate the database:
```
$ rails db:migrate
```

Finally, run the test suite to verify that everything is working correctly:
```
$ rails test
```

If the test suite passes, you'll be ready to run the app in a local server:
```
$ rails server
```
