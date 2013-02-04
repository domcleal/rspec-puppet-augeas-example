# rspec-puppet-augeas example project

This is an example Puppet module that's set up to use rspec-puppet and
rspec-puppet-augeas.

To reproduce it:

* create manifests
* run `gem install rspec-puppet-augeas`
* run `rspec-puppet-init`
* add this to the top of `spec/spec_helper.rb`:
  * `require 'rspec-puppet-augeas'`
* add this to the RSpec.configure section of `spec/spec_helper.rb`:
  * `c.augeas_fixtures = File.join(fixture_path, 'augeas')`
* create `spec/fixtures/augeas/` and place input files underneath in the normal filesystem layout (e.g. `spec/fixtures/augeas/etc/sysctl.conf`
* add tests to `spec/classes` and `spec/defines`

See the [rspec-puppet-augeas README](https://github.com/domcleal/rspec-puppet-augeas/blob/master/README.md)
and its specs for test examples.
