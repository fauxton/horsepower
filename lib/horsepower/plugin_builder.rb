module Horsepower
  module RubyVersion
    MAJOR = "2.0"
    PATCH_LEVEL = "353"
  end

  class PluginBuilder < Rails::PluginBuilder
    def setup_rvm
      run "rvm use #{ruby}@#{name} --create"
    end

    def bundle
      run "bundle install"
    end

    def readme
      remove_file "README.rdoc"
      template("README.md.erb", "README.md", force: true)
    end

    def custom_gemfile
      copy_file("horsepower_Gemfile", "Gemfile", force: true)
    end

    def install_rspec
      generate "rspec:install"
    end

    def install_cucumber
      generate "cucumber:install"
    end

    def configure_cucumber
      inject_into_file "features/support/env.rb", before: "require 'cucumber/rails'" do <<-RUBY
ENV["RAILS_ROOT"] ||= File.expand_path(File.dirname(__FILE__) + '/../../spec/dummy')
      RUBY
      end
    end

    def add_gemspec_dependencies
      inject_into_file "#{name}.gemspec", after: '"jquery-rails"' do <<-RUBY

  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "cucumber-rails"
  s.add_development_dependency "database_cleaner"
  s.add_development_dependency "parallel_tests"
RUBY
      end
    end

    def replace_readme_format_in_gemspec
      gsub_file("#{name}.gemspec", "README.rdoc", "README.md")
    end

    def ruby
      "ruby-#{RubyVersion::MAJOR}-p#{RubyVersion::PATCH_LEVEL}"
    end
  end
end
