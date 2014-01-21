# Opensrs::Email

API to manage opensrs domain emails through APP (OpenSRS Email Service Account Provisioning Protocol)

## Installation

Add this line to your application's Gemfile:

    gem 'opensrs-email'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install opensrs-email

## Usage

    PRODSRS = OpensrsEmail.new(server, port, username, domain, password)

    domain = 'testdomain.com'
    
    TESTSRS.call(:create_domain, {:domain => domain})
    TESTSRS.call(:create_mailbox, {:domain => domain, :workgroup => "staff", :mailbox => "julie", :password => "julia"})
    TESTSRS.call(:verify_password, {:domain => domain, :mailbox => "julie", :password => "julia"})
    TESTSRS.call(:set_mailbox_forward, {:mailbox => "julie", :domain => domain, :forward => "user@anotherdomain.com"})

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
