require 'rake'
require 'rake/testtask'
require 'rake/clean'
require 'fileutils'

Rake::TestTask.new do |t|
	t.libs << "test"
	t.test_files = FileList['test/*_test.rb']
	t.verbose = true
end

task :default => ["test"]

desc "Run the game"
task :run do
	sh "ruby init.rb"
end

# Conditional require rcov/rcovtask if present
begin
  require 'rcov/rcovtask'

	Rcov::RcovTask.new do |t|
		t.test_files = FileList['test/*_test.rb']
		t.rcov_opts << "-x /usr"
		t.output_dir = "test/coverage"
	end
rescue Object
end
