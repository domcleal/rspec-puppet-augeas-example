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

## Example output

The module contains one successful and one failing test.  Note the debug output
is provided too.

    $ rake spec
    /home/dcleal/.rvm/rubies/ruby-1.8.7-p370/bin/ruby -S rspec spec/classes/example_spec.rb
    ..F
    
    Failures:
    
      1) example Augeas[fail net.ipv4.ip_forward] should run
         Failure/Error: should execute.with_change
           Augeas[fail net.ipv4.ip_forward] fails when executing:
           debug: Opening augeas with root /tmp/rspec-puppet-augeas20130204-5290-1si6gzy, lens path , flags 32
           debug: Augeas version 1.0.0 is installed
           debug: Will attempt to save and only run if files changed
           debug: sending command 'clear' with params ["/files/etc/sysctl.conf/net.ipv4.ip_forward"]
           debug: Put failed on one or more files, output from /augeas//error:
           debug: /augeas/files/etc/sysctl.conf/error/path = /files/etc/sysctl.conf
           debug: /augeas/files/etc/sysctl.conf/error/lens = /usr/share/augeas/lenses/dist/sysctl.aug:36.10-.52:
           debug: /augeas/files/etc/sysctl.conf/error/message = Malformed child node
           debug: Closed the augeas connection
           err: Could not evaluate: Save failed with return code false, see debug
         # ./spec/classes/example_spec.rb:18
    
    Finished in 1.54 seconds
    3 examples, 1 failure
    
    Failed examples:
    
    rspec ./spec/classes/example_spec.rb:17 # example Augeas[fail net.ipv4.ip_forward] should run
    rake aborted!
    /home/dcleal/.rvm/rubies/ruby-1.8.7-p370/bin/ruby -S rspec spec/classes/example_spec.rb failed
    
    Tasks: TOP => spec
    (See full trace by running task with --trace)
