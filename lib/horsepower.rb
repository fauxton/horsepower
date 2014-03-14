require "horsepower/version"

module Horsepower
  def self.require_plugin_generator
    if Rails::VERSION::MAJOR == 4
      require 'rails/generators/rails/plugin/plugin_generator'
    else
      require 'rails/generators/rails/plugin_new/plugin_new_generator'
    end
  end

  def self.plugin_klass
    if Rails::VERSION::MAJOR == 4
      Rails::Generators::PluginGenerator
    else
      Rails::Generators::PluginNewGenerator
    end
  end
end
