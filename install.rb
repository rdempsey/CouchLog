require 'fileutils'

#copy couchlog_sample.yml to config directory
couchlog_config = File.dirname(__FILE__) + '/../../../config/couchlog.yml'
couchlog_lib = File.dirname(__FILE__) + '/../../../lib/couch_log.rb'

unless File.exist?(couchlog_config) && File.exist?(couchlog_lib)
  FileUtils.copy(File.dirname(__FILE__) + '/couchlog.yml.sample',couchlog_config)
  FileUtils.copy(File.dirname(__FILE__) + '/lib/couch_log.rb',couchlog_lib)
end
