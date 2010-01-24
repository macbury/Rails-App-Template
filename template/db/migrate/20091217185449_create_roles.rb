class CreateRoles < ActiveRecord::Migration
  def self.up
    create_table :roles do |t|
      t.string :name
      t.timestamps
    end

		[:admin, :moderator].each do |role_name|
			Role.create(:name => role_name.to_s)
		end
  end

  def self.down
    drop_table :roles
  end
end
