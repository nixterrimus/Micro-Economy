# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "micro_economy/version"

Gem::Specification.new do |s|
  s.name        = "micro_economy"
  s.version     = MicroEconomy::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Nicholas Rowe"]
  s.email       = ["nixterrimus@dcxn.com"]
  s.homepage    = ""
  s.summary     = %q{The Numbers On the World Around You.}
  s.description = %q{Micro Economy Lets You learn more about your economy at a hyper local level}

  s.rubyforge_project = "micro_economy"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
