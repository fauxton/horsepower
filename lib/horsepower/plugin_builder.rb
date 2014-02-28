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

    def ruby
      "ruby-#{RubyVersion::MAJOR}-p#{RubyVersion::PATCH_LEVEL}"
    end
  end
end
