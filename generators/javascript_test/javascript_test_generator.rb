class JavascriptTestGenerator < Rails::Generator::NamedBase  
  default_options :app_assets => false, :prototype => false, :extjs => false

  def manifest
    record do |m|
      m.directory File.join("test","javascript")      
      m.template 'javascript_test.html', File.join('test/javascript', "#{name}_test.html")
    end
  end
  
  protected
  def banner
    "Usage: #{$0} javascript_test libary_file [--use-app-assets] [--prototype] [--extjs]"
  end

  def add_options!(opt)
    opt.separator ''
    opt.separator 'Options:'
    opt.on("-P", "--prototype",
         "Uses prototype.js with unittest.js instead of jsunittest.js") { |v| options[:prototype] = v }
    opt.on("-A", "--use-app-assets",
         "Uses application's own version of prototype.js instead of the plugins (in conjunction with --prototype)") { |v| options[:app_assets] = v }
    opt.on("-E", "--extjs",
         "Adds script tags for loading ExtJs with the generated test (ExtJs is expected to be installed in public/ext)") { |v| options[:extjs] = v }
  end
end