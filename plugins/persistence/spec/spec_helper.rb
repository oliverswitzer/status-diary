require_relative '../lib/persistence'

ActiveRecord::Base.establish_connection(adapter: 'postgresql', database: 'StatusDiary_test')
ActiveRecord::Migrator.up(File.join(__dir__, '..', 'lib', 'persistence', 'migrations'))

RSpec.configure do |c|
  c.before do
    Persistence::ProjectRecord.delete_all
  end
end
