# tumblr exodus

## API that doesn't require auth

Uses e.g. http://klubbdinmamma.com/api/read/json/.

Download the JSON if you want to inspect it:

    curl -o public_api.json http://klubbdinmamma.com/api/read/json/

Run the Jekyll importer:

    bundle install
    bundle exec ruby import.rb

Will save posts to `_posts/tumblr/` and images to `tumblr_files/`.

## API requiring auth

Docs: https://www.tumblr.com/docs/en/api/v2

Write posts to `<blog_name>.json`:

    bundle install
    gem install dotenv
    dotenv bundle exec ruby tumblr_export.rb

### `.env`

    blog_name=

    # Tumblr credentials
    blog_name=
    consumer_key=
    consumer_secret=
    oauth_token=
    oauth_token_secret=
