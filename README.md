[![Actions Status](https://github.com/barbedak/rails-project-63/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/barbedak/rails-project-63/actions)
# HexletCode

Gem for generate html form.

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add hexlet_code

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install hexlet_code

## Usage

use
`
user = User.new name: 'rob', job: 'hexlet', gender: 'm'
HexletCode.form_for(user, url: '/profile', method: :get, class: 'hexlet-form') do |f|
    f.input :name, class: 'user-input'
    f.input :job, as: :text, cols: 50, rows: 50
    f.submit 'Wow'
end
`
to generate html
`
<form action="/profile" method="get" class="hexlet-form">
    <label for="name">Name</label>
    <input name="name" type="text" value="rob" class="user-input">
    <label for="job">Job</label>
    <textarea name="job" cols="50" rows="50">hexlet</textarea>
    <input type="submit" value="Wow">
</form>
`
## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the HexletCode project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/hexlet_code/blob/master/CODE_OF_CONDUCT.md).
