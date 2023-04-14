# mastodown
Docker image to download masto stuff on a schedule.
Uses [mastodon-archive](https://github.com/kensanata/mastodon-archive) to archive your toots.

Archives:
* Toots
* Favorites
* Mentions
* Media files for above

Resulting archive is stored in `/data` in the container

First time running you will need to setup the account by creating an initial archive.
You can do this be execing into the container, and running the following:

```bash
mastodon-archive archive <account>
```

You can do this multiple times to add multiple accounts.
Each time the cron job runs, it will archive all the accounts that are configured.

## Reference commands

Using this container you can also run commands.
For full reference see []() or run `mastodon-archive --help`


Normal archive:

```bash
mastodon-archive archive --with-mentions "<account>"
mastodon-archive media --collection favourites "<account>"
```

Expiring Statuses:
```bash
mastodon-archive expire --older-than 8 --collection statuses --confirm "<account>"
```

Expiring Favourites:
```bash
mastodon-archive expire --older-than 8 --collection favourites --confirm "<account>"
```

Dismissing Notifications:
```bash
mastodon-archive expire --older-than 8 --collection mentions --delete-other-notifications --confirm "<account>"
```