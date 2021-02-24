# -*- encoding: utf-8 -*-
# stub: octicons_helper 12.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "octicons_helper".freeze
  s.version = "12.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["GitHub Inc.".freeze]
  s.date = "2021-02-04"
  s.description = "A rails helper that makes including svg Octicons simple.".freeze
  s.email = ["support@github.com".freeze]
  s.homepage = "https://github.com/primer/octicons".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.2.7".freeze
  s.summary = "Octicons rails helper".freeze

  s.installed_by_version = "3.2.7" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<octicons>.freeze, ["= 12.0.0"])
    s.add_runtime_dependency(%q<rails>.freeze, [">= 0"])
  else
    s.add_dependency(%q<octicons>.freeze, ["= 12.0.0"])
    s.add_dependency(%q<rails>.freeze, [">= 0"])
  end
end
