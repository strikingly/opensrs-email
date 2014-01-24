# Opensrs::Email

[![Build Status](https://travis-ci.org/strikingly/opensrs-email.png?branch=master)](https://travis-ci.org/strikingly/opensrs-email)

API to manage opensrs domain emails through APP (OpenSRS Email Service Account Provisioning Protocol)

## Installation

Add this line to your application's Gemfile:

    gem 'opensrs-email'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install opensrs-email

## Usage

    gateway = Opensrs::Email::Gateway.new(OPENSRS_EMAIL_SERVER, OPENSRS_EMAIL_PORT, OPENSRS_EMAIL_USERNAME, OPENSRS_EMAIL_DOMAIN, OPENSRS_EMAIL_PASSWORD)

    gateway.delete_mailbox_forward_only(mailbox, domain)
    
## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
