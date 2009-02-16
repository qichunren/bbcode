# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{bbcode}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Zhang Jinzhu"]
  s.date = %q{2009-02-16}
  s.description = %q{BBcode}
  s.email = %q{wosmvp@gmail.com}
  s.extra_rdoc_files = ["lib/version.rb", "lib/bbcode.rb"]
  s.files = ["test/test_bbcode.rb", "test/test_helper.rb", "Rakefile", "lib/version.rb", "lib/bbcode.rb", "Manifest", "bbcode.gemspec"]
  s.has_rdoc = true
  s.homepage = %q{http://www.zhangjinzhu.com}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Bbcode"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{bbcode}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{BBcode}
  s.test_files = ["test/test_bbcode.rb", "test/test_helper.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
