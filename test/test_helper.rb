require 'rubygems'
require "ruby-debug"
require "active_record"
require "action_controller"
require "active_record/fixtures"
require 'active_support'
require 'active_support/test_case'
#require "couchrest"
require 'test/unit'

ENV['RAILS_ENV'] = 'test'
ENV['RAILS_ROOT'] ||= File.dirname(__FILE__) + '/../../../..'

#SERVER = CouchRest.new
#DB = "authlounge_#{RAILS_ENV}"
#db = SERVER.database(DB)
#db.recreate! rescue nil
#SERVER.default_database = DB

require File.expand_path(File.join(ENV['RAILS_ROOT'], 'config/environment.rb')) 

def load_config
  config = YAML::load(IO.read(File.dirname(__FILE__) + '/couchlog_config.yml'))
  ActiveRecord::Base.logger = Logger.new(File.dirname(__FILE__) + "/debug.log")
  require File.dirname(__FILE__) + '/../rails/init.rb' 
end