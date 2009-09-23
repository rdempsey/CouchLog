require 'active_support'
require 'couchrest'

class CouchLog < ActiveSupport::BufferedLogger
  
  private  
   
  # CustomLogger doesn't define strings for log levels  
  # so we have to do it ourselves  
  def severity_string(level)  
    case level  
    when DEBUG  
      :DEBUG  
    when INFO  
      :INFO  
    when WARN  
      :WARN  
    when ERROR  
      :ERROR  
    when FATAL  
      :FATAL  
    else  
      :UNKNOWN  
    end  
  end  
   
  public  
   
  # monkey patch the CustomLogger add method so that  
  # we can format the log messages the way we want  
  def add(severity, message = nil, progname = nil, &block)  
    return if @level > severity  
    message = (message || (block && block.call) || progname).to_s  

    # Log everything to CouchDB
    # Don't show anything on the command or in the log files
    # Format = { DateTime, Severity, Message }
    db = CouchRest.database!("http://127.0.0.1:5984/couch_log_lib_test")
    message = db.save_doc({
      "DateTime" => Time.now.strftime("%m/%d/%Y %H:%M:%S"),
      "Severity" => severity_string(severity),
      "Message" => message
    })
    
  end
    
end