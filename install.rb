require 'fileutils'

public_dir = File.dirname(__FILE__) + "/../../../public"
plugin_dir = File.dirname(__FILE__) + "/public"

FileUtils.install(plugin_dir + "/stylesheets/system_messages.css", public_dir + "/stylesheets")
FileUtils.install(plugin_dir + "/images/info_warning_msg.png", public_dir + "/images")
FileUtils.install(plugin_dir + "/images/error_msg.png", public_dir + "/images")

puts IO.read(File.join(File.dirname(__FILE__), 'README'))