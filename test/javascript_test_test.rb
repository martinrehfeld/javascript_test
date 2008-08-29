require 'test/unit'
require 'lib/javascript_test.rb'

# mock RAILS_ROOT required because of file existance check
RAILS_ROOT = File.dirname(File.expand_path(__FILE__));

class JavascriptTestTest < Test::Unit::TestCase
  
  def runner_for(test)
    JavaScriptTest::Runner.new do |t| 
      t.mount("/test", RAILS_ROOT+'/test')
      t.mount('/test/javascript/assets', RAILS_ROOT+'/../assets')
      t.run(test)
      #t.browser(:firefox)
      t.browser(:safari)
    end
  end
  
  def test_should_pass_on_successful_test
    assert runner_for(:success).successful?
  end
  
  def test_should_fail_on_failing_test
    assert !(runner_for(:failure).successful?)
  end
  
end