class SystemMessagesGenerator < Rails::Generator::Base
  def manifest
    record do |m|
      m.template 'model.rb', File.join('app/models',"system_message.rb")
      m.template 'controller.rb', File.join('app/controllers',"system_messages_controller.rb")
      m.migration_template 'migration.rb', 'db/migrate', :migration_file_name => "create_system_messages"
    end
  end
end
