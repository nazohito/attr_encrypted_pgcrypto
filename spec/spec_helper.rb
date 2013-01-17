require 'pry'
require 'attr_encrypted_pgcrypto'

SPEC_ROOT = Pathname.new File.expand_path File.dirname __FILE__
Dir[SPEC_ROOT.join('support/*.rb')].each{|f| require f }

# This file was generated by the `rspec --init` command. Conventionally, all
# specs live under a `spec` directory, which RSpec adds to the `$LOAD_PATH`.
# Require this file using `require "spec_helper"` to ensure that it is only
# loaded once.
#
# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = 'random'

  # When setting boolean tags/metadata, allow an array shorthand instead of hash
  #
  # Example
  #
  #     it "wants my attention", :focus do
  #
  # https://www.relishapp.com/rspec/rspec-core/docs/metadata/user-defined-metadata
  config.treat_symbols_as_metadata_keys_with_true_values = true

  # https://www.relishapp.com/rspec/rspec-core/docs/filtering/run-all-when-everything-filtered
  config.run_all_when_everything_filtered = true
end