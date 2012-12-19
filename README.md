# Foxit

Foxit is an simple Ruby wrapper around [gitlab](https://github.com/gitlabhq/gitlabhq/tree/master/doc/api) V2 API.

The design is inspired by [octokit](https://github.com/pengwynn/octokit), a Github V3 API wrapper.

## Installation

    gem install octokit

## Usage

```ruby
## Initlize the connection
client = Octokit::Client.new(:end_point => "me", :private_token => "sekret")


## query methods
## closely mapping to the Gitlab API V2

client.users

client.create_user

client.project('yangchenyun/foxit')


```

Checkout the [`client`](https://github.com/yangchenyun/foxit/tree/master/lib/foxit/client) folder for all available methods on the `cli` object.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
