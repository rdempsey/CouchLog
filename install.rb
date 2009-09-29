require 'fileutils'

#copy couchlog_sample.yml to config directory
couchlog_config = File.dirname(__FILE__) + '/../../../config/couchlog.yml'
unless File.exist?(couchlog_config)
  FileUtils.copy(File.dirname(__FILE__) + '/couchlog.yml.sample',couchlog_config)
end
