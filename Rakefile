require 'rspec/core/rake_task'

task default: [:test]

desc 'Run all specs in spec directory (exluding request/integration specs)'
RSpec::Core::RakeTask.new(:test) do |task|
  file_list = FileList[
    'plugins/persistence/spec/**/*_spec.rb',
    'plugins/api/spec/**/*_spec.rb',
    'status_diary/spec/**/*_spec.rb'
  ]

  task.pattern = file_list
end
