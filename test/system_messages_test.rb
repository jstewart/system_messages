require 'test/unit'
require File.join(File.dirname(__FILE__), '../generators/system_messages/templates/model')


class SystemMessagesTest < Test::Unit::TestCase
 
 def setup  
   @global_msg = SystemMessage.create!(:level => 'info', :header => 'Information',
    :message => "global", :expires => 1.day_from_now)
   @dismissed_global_msg = SystemMessage.create!(:level => 'info', :header => 'Information',
     :message => "global", :expires => 1.day_from_now, :dismissed => true)
   @msg = SystemMessage.create!(:level => 'info', :header => 'Information',
    :message => "Werd", :messageable_id => 1, :messageable_type => 'Widget', :expires => 1.day_from_now)
 end
 
 def test_global
   assert_equal(SystemMessage.global.count, 2)
 end
 
 def test_viewable
   assert_equal(@global_msg.viewable?, true)
 end
 
 def test_expired_returns_true_when_expired
   @global_msg.expires = 1.day_ago
   assert_equal(@global_msg.expired?, true)
 end
 
 def test_expired_returns_false_when_not_expired
   assert_equal(@global_msg.expired?, false)
 end
 
 def test_viewable_scope
   assert_equal(SystemMessage.viewable.count, 2)
 end
 
 def test_not_viewable_when_expired
   @global_msg.expires = 1.day_ago
   assert_equal(@global_msg.viewable?, false)
 end
 
 def test_not_viewable_when_dismissed 
   @global_msg.dismissed = true
   assert_equal(@global_msg.viewable?, false)
 end

  
end
