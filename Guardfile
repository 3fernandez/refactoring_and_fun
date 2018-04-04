guard :rspec, cmd: "bundle exec rspec" do
  require "guard/rspec/dsl"
  dsl = Guard::RSpec::Dsl.new(self)

  # RSpec files
  rspec = dsl.rspec
  watch(rspec.spec_files)

  # Ruby files
  ruby = dsl.ruby
  dsl.watch_spec_files_for(ruby.lib_files)
end

guard :rubycritic, cmd: "bin/rubycritic" do
  watch(%r{^app/(.+)\.rb$})
  watch(%r{^lib/(.+)\.rb$})
end
