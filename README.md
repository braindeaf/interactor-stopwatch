# Interactor::Stopwatch



## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add interactor-stopwatch

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install interactor-stopwatch

## Usage

A sample Interactor could look a little like this, the `stopwatch` block yields in the context of our interactor instance with a single block parameter  (ActiveSupport::Duration) of the interactor's lifecycle.

```ruby
class TakeTime
  include Interactor
  include Interactor::Stopwatch

  stopwatch do |duration|
    puts "TakeTime took #{duration}s"
  end

  def call
    sleep 0.1
    context.message = 'I measured how long this took'
  end
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/braindeaf/interactor-stopwatch.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
