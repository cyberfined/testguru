# -*- encoding: utf-8 -*-
# stub: webdrivers 4.4.1 ruby lib

Gem::Specification.new do |s|
  s.name = "webdrivers".freeze
  s.version = "4.4.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "bug_tracker_uri" => "https://github.com/titusfortner/webdrivers/issues", "changelog_uri" => "https://github.com/titusfortner/webdrivers/blob/master/CHANGELOG.md", "documentation_uri" => "https://www.rubydoc.info/gems/webdrivers/4.4.1", "source_code_uri" => "https://github.com/titusfortner/webdrivers/tree/v4.4.1" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Titus Fortner".freeze, "Lakshya Kapoor".freeze, "Thomas Walpole".freeze]
  s.date = "2020-06-02"
  s.description = "Run Selenium tests more easily with install and updates for all supported webdrivers.".freeze
  s.email = ["titusfortner@gmail.com".freeze, "kapoorlakshya@gmail.com".freeze]
  s.homepage = "https://github.com/titusfortner/webdrivers".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.4.0".freeze)
  s.rubygems_version = "3.1.4".freeze
  s.summary = "Easy download and use of browser drivers.".freeze

  s.installed_by_version = "3.1.4" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_development_dependency(%q<ffi>.freeze, ["~> 1.0"])
    s.add_development_dependency(%q<rake>.freeze, ["~> 12.0"])
    s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
    s.add_development_dependency(%q<rubocop>.freeze, ["~> 0.66"])
    s.add_development_dependency(%q<rubocop-performance>.freeze, [">= 0"])
    s.add_development_dependency(%q<rubocop-rspec>.freeze, ["~> 1.32"])
    s.add_development_dependency(%q<simplecov>.freeze, ["~> 0.16"])
    s.add_runtime_dependency(%q<nokogiri>.freeze, ["~> 1.6"])
    s.add_runtime_dependency(%q<rubyzip>.freeze, [">= 1.3.0"])
    s.add_runtime_dependency(%q<selenium-webdriver>.freeze, [">= 3.0", "< 4.0"])
  else
    s.add_dependency(%q<ffi>.freeze, ["~> 1.0"])
    s.add_dependency(%q<rake>.freeze, ["~> 12.0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
    s.add_dependency(%q<rubocop>.freeze, ["~> 0.66"])
    s.add_dependency(%q<rubocop-performance>.freeze, [">= 0"])
    s.add_dependency(%q<rubocop-rspec>.freeze, ["~> 1.32"])
    s.add_dependency(%q<simplecov>.freeze, ["~> 0.16"])
    s.add_dependency(%q<nokogiri>.freeze, ["~> 1.6"])
    s.add_dependency(%q<rubyzip>.freeze, [">= 1.3.0"])
    s.add_dependency(%q<selenium-webdriver>.freeze, [">= 3.0", "< 4.0"])
  end
end
