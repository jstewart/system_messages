class CreateSystemMessages < ActiveRecord::Migration

  def self.up
    create_table :system_messages do |t|
      t.string        :header
      t.string        :level
      t.text          :message
      t.boolean       :dismissed, :default => false
      t.boolean       :dismissable, :default => false
      t.datetime      :expires
      t.references    :messageable, :polymorphic => true
      t.timestamp
    end
  end

  def self.down
    drop_table :system_messages
  end

end