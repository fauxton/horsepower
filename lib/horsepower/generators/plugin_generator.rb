require 'rails/generators'
require 'rails/generators/rails/app/app_generator'
require 'horsepower'
Horsepower.require_plugin_generator

module Horsepower
  class PluginGenerator < plugin_klass
    class_option :database, type: :string, aliases: '-d', default: 'postgresql',
      desc: "Preconfigure for selected database (options: #{DATABASES.join('/')})"

    class_option :skip_test_unit, type: :boolean, aliases: '-T', default: true, desc: 'Skip Test::Unit files'

    class_option :skip_bundle, type: :boolean, aliases: '-B', default: true, desc: "Don't run bundle install"

    class_option :mountable, type: :boolean, default: true, desc: "Generate mountable isolated application"

    class_option :dummy_path, type: :string, default: "spec/dummy", desc: "Create dummy application at given path"

    def finish_template
      invoke :horsepower_customization
      super
    end

    def horsepower_customization
      invoke :hello
      invoke :custom_readme
      invoke :custom_gemfile
      invoke :custom_gemspec
      invoke :setup_rvm
      invoke :bundle
      invoke :setup_test_frameworks
      invoke :goodbye
    end

    def custom_readme
      say "Converting README to markdown..."
      build :readme
    end

    def bundle
      build :bundle
    end

    def hello
      say "Horsepower is creating your engine..."
    end

    def setup_test_frameworks
      say "Installing/configuring test frameworks..."
      build :install_rspec
      build :install_cucumber
      build :configure_cucumber
    end

    def setup_rvm
      build :setup_rvm
    end

    def custom_gemfile
      build :custom_gemfile
    end

    def custom_gemspec
      build :add_gemspec_dependencies
      build :replace_readme_format_in_gemspec
    end

    def goodbye
      say "Vroom...Vroom..."
    end

    protected

    def get_builder_class
      Horsepower::PluginBuilder
    end
  end
end
