require File.dirname(__FILE__) + '/lib/acts_as_event'
ActiveRecord::Base.send(:include, Janya::Acts::Event)
