require "rspec"

spec_dir = File.dirname(__FILE__)
$LOAD_PATH.unshift(spec_dir)

Dir[File.join(spec_dir, "support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
end
