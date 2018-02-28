[![Gem Version](https://badge.fury.io/rb/text_detector.svg)](http://badge.fury.io/rb/text_detector)
[![Build Status](https://travis-ci.org/feedforce/text_detector.svg?branch=master)](https://travis-ci.org/feedforce/text_detector)

# TextDetector

This is an experimental implementation for detecting text from document.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'text_detector'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install text_detector

## Usage

See also `bin/benchmark` and `examples/`.

### Regexp

```ruby
require 'text_detector'
regexp_detector = TextDetector.factory(:regexp, open('dictionary.txt'))
regexp_detector.detect('The detector detects NG word from this document. The dictionary has many NG words.')
```

### Like Boyer-Moore String Search Algorithm

```ruby
require 'text_detector'
simple_detector = TextDetector.factory(:simple, open('dictionary.txt'))
simple_detector.detect('The detector detects NG word from this document. The dictionary has many NG words.')
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/feedforce/text_detector/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
