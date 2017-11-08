# -*- encoding: utf-8 -*-
# stub: airbrussh 1.3.0 ruby lib

Gem::Specification.new do |s|
  s.name = "airbrussh"
  s.version = "1.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Matt Brictson"]
  s.bindir = "exe"
  s.date = "2017-06-16"
  s.description = "A replacement log formatter for SSHKit that makes Capistrano output much easier on the eyes. Just add Airbrussh to your Capfile and enjoy concise, useful log output that is easy to read."
  s.email = ["airbrussh@mattbrictson.com"]
  s.homepage = "https://github.com/mattbrictson/airbrussh"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.5"
  s.summary = "Airbrussh pretties up your SSHKit and Capistrano output"

  s.installed_by_version = "2.4.5" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<sshkit>, ["!= 1.7.0", ">= 1.6.1"])
      s.add_development_dependency(%q<bundler>, ["~> 1.10"])
      s.add_development_dependency(%q<coveralls>, ["~> 0.8.15"])
      s.add_development_dependency(%q<rake>, ["~> 12.0"])
      s.add_development_dependency(%q<minitest>, ["~> 5.10"])
      s.add_development_dependency(%q<minitest-reporters>, ["~> 1.1"])
      s.add_development_dependency(%q<mocha>, ["~> 1.2"])
      s.add_development_dependency(%q<rubocop>, ["~> 0.41.2"])
    else
      s.add_dependency(%q<sshkit>, ["!= 1.7.0", ">= 1.6.1"])
      s.add_dependency(%q<bundler>, ["~> 1.10"])
      s.add_dependency(%q<coveralls>, ["~> 0.8.15"])
      s.add_dependency(%q<rake>, ["~> 12.0"])
      s.add_dependency(%q<minitest>, ["~> 5.10"])
      s.add_dependency(%q<minitest-reporters>, ["~> 1.1"])
      s.add_dependency(%q<mocha>, ["~> 1.2"])
      s.add_dependency(%q<rubocop>, ["~> 0.41.2"])
    end
  else
    s.add_dependency(%q<sshkit>, ["!= 1.7.0", ">= 1.6.1"])
    s.add_dependency(%q<bundler>, ["~> 1.10"])
    s.add_dependency(%q<coveralls>, ["~> 0.8.15"])
    s.add_dependency(%q<rake>, ["~> 12.0"])
    s.add_dependency(%q<minitest>, ["~> 5.10"])
    s.add_dependency(%q<minitest-reporters>, ["~> 1.1"])
    s.add_dependency(%q<mocha>, ["~> 1.2"])
    s.add_dependency(%q<rubocop>, ["~> 0.41.2"])
  end
end
