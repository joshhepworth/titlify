# encoding: UTF-8

$:.push File.expand_path("../lib", __FILE__)
require "titlify/version"

Gem::Specification.new do |s|
  s.name        = "titlify"
  s.version     = Titlify::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Josh Hepworth"]
  s.email       = ["josh@friendsoftheweb.com"]
  s.homepage    = "http://github.com/fotw/titlify"
  s.summary     = %q{Gonna be the best damn titlecasing function around.}
  s.description = s.summary

  s.rubyforge_project = "titlify"

  # s.add_dependency("nokogiri")

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths  = ["lib"]
end
