# Christel

This is my second take on christel, a ruby library and specification of a
language to represent, work with and render crochet patterns.

I will gradually move code over here, but investible time is scarce.

Documentation will ship when the language spec settles.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'christel'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install christel

## Usage

**christel** comes with a main executable, `cpl` which is used to debug the CPL and render patterns.

## Stuff included

Currently there is only one tool, `cpl.rb` which allows you to parse and
render .cpl pattern files.

Invoke it with --help to see the options.

## CPL the Crochet/Christel Pattern Language

Optimally, one day CPL is the standard form to write down (standard) crochet
patterns.

Of course, not all patterns can be formalized easily, but I hope to cover
a good 10\% of the patterns out there.

Currently, the CPL assumes that you work in rings.

While the treetop grammar reads relatively easy (ignore the parts in sharp brackets, `< ... >`) here is a run-down:

### General syntax

The file can contain comments, any line starting with a `#` is ignored.

    # This is a comment

Following stitches are supported:

  - Chain Stitch: `ch`
  - Magical Ring
  - Single Crochet: `sc`
  - Slip Stitch: `slst`

Multiple stitches of the same type are denoted by the corresponding number and the (short) stitch type:

    # This is a comment
    10 ch
    # Ten Chain Stitches

and connected by commata (`,`):

    # This is ...
    10 ch, 4 sc

Stitching in magical ring works a little bit different:

    # Comment of ring example
    6 sc in ring, slst

.

## How this could help

  - finally a repository of truly free crochet patterns
  - unified formalism for crochet patterns
  - visualize patterns to have it easy
  - translate patterns into other languages

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment. Run `bundle exec christel` to use the gem in this directory, ignoring other installed copies of this gem.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/christel. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

