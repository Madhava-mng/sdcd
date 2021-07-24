# Sdcd

sdcd is the subdomain compresser.
like database only for subdomain storage.
like,

```json
{
	"test.com": [
		"api.test.com",
		"mail.test.com"
		]
}
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sdcd'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install sdcd

## Usage
compress

```ruby
require 'sdcd'
sdcd = SDCD::new
data = sdcd.compress("test.com", ["api", "mail"])
puts sdcd.decompress(data)
# It print
{
	"test.com": [
		"api.test.com",
		"mail.test.com"
		]
}
```

you can also add full sub domain "api.test.com" inted of "api" 

**With files:**

```ruby
# To write file

sdcd.write("domain.sdcd", "test.com", ["foo", "bar"])

# To read File

data = adcd.read(domain.sdcd)
puts data
# It print
{
	"test.com": [
		"foo.test.com",
		"bar.test.com"
		]
}
```

## GemUrl
[gem](https://rubygems.org/gems/sdcd).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Madhava-mng/sdcd.
