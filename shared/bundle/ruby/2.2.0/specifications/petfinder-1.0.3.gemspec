# -*- encoding: utf-8 -*-
# stub: petfinder 1.0.3 ruby lib

Gem::Specification.new do |s|
  s.name = "petfinder"
  s.version = "1.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Eric Hutzelman"]
  s.date = "2015-10-06"
  s.description = "REST client for the Petfinder published API."
  s.email = ["ehutzelman@gmail.com"]
  s.homepage = "http://github.com/ehutzelman/petfinder"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.5"
  s.summary = "Ruby gem wrapper for the Petfinder API."

  s.installed_by_version = "2.4.5" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<excon>, ["~> 0.26"])
      s.add_runtime_dependency(%q<nokogiri>, ["~> 1.6"])
      s.add_development_dependency(%q<bundler>, ["~> 1.3"])
    else
      s.add_dependency(%q<excon>, ["~> 0.26"])
      s.add_dependency(%q<nokogiri>, ["~> 1.6"])
      s.add_dependency(%q<bundler>, ["~> 1.3"])
    end
  else
    s.add_dependency(%q<excon>, ["~> 0.26"])
    s.add_dependency(%q<nokogiri>, ["~> 1.6"])
    s.add_dependency(%q<bundler>, ["~> 1.3"])
  end
end
