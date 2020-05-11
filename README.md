# GrapeEntityInclude

An include option for grape-entity, expose attributes if matching with attr_path option by using `include_attr_path?` method

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'grape-entity-include'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install grape-entity-include

## Usage

Assume that you already had grape entities that sit on top of object models.

### Example
```ruby
UserEntity.represent(user_model, include: [:friends, { posts: [:comments, :photos] }])

class UserEntity < Grape::Entity
    expose :name
    expose :email
    expose :friends, using: UserEntity, if: include_attr_path?
    expose :posts, using: PostEntity, if: include_attr_path?
end

class PostEntity < Grape::Entity
    expose :title
    expose :content
    expose :comments, using: CommentEntity, if: include_attr_path?
    expose :photos, using: PhotoEntity, if: include_attr_path?
end

class CommentEntity < Grape::Entity
    expose :content
end

class PhotoEntity < Grape::Entity
    expose :caption
    expose :url
end

```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ntd63t/grape-entity-include. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/ntd63t/grape-entity-include/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the GrapeEntityInclude project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/ntd63t/grape-entity-include/blob/master/CODE_OF_CONDUCT.md).
