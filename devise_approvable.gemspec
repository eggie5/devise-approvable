# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: devise_approvable 0.14.0 ruby lib

Gem::Specification.new do |s|
  s.name = "devise_approvable"
  s.version = "0.14.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Alex Egg"]
  s.date = "2015-07-01"
  s.description = "adds feature to devise"
  s.email = "eggie5@gmail.com"
  s.extra_rdoc_files = [
    "README"
  ]
  s.files = [
    "Gemfile",
    "Gemfile.lock",
    "README",
    "Rakefile",
    "VERSION",
    "app/controllers/devise/approvals_controller.rb",
    "app/views/devise/approvals/new.html.erb",
    "app/views/devise/mailer/approval_instructions.html.haml",
    "config/initializers/devise.rb",
    "devise_approvable.gemspec",
    "lib/devise_approvable.rb",
    "lib/devise_approvable/mailer.rb",
    "lib/devise_approvable/model.rb",
    "lib/devise_approvable/rails.rb",
    "lib/devise_approvable/routes.rb",
    "lib/devise_approvable/version.rb",
    "test/approvable_test.rb"
  ]
  s.homepage = "http://github.com/eggie5/devise-approvable"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.2.1"
  s.summary = "Oh so perfect"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_development_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 2.0.1"])
      s.add_development_dependency(%q<simplecov>, [">= 0"])
    else
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_dependency(%q<bundler>, ["~> 1.0"])
      s.add_dependency(%q<jeweler>, ["~> 2.0.1"])
      s.add_dependency(%q<simplecov>, [">= 0"])
    end
  else
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<rdoc>, ["~> 3.12"])
    s.add_dependency(%q<bundler>, ["~> 1.0"])
    s.add_dependency(%q<jeweler>, ["~> 2.0.1"])
    s.add_dependency(%q<simplecov>, [">= 0"])
  end
end

