worker_processes 1
working_directory "/home/jimmy/blog"
listen 9000
timeout 30
pid "/tmp/blog.pid"
stderr_path "/home/jimmy/logs/unicorn.error.log"
stdout_path "/home/jimmy/logs/unicorn.log"

preload_app true
GC.respond_to?(:copy_on_write_friendly=) and
	GC.copy_on_write_friendly = true

before_fork do |server, worker|
	defined?(ActiveRecord::Base) and
		ActiveRecord::Base.connection.disconnect!

	sleep 1
end

after_fork do |server, worker|
	defined?(ActiveRecord::Base) and
		ActiveRecord::Base.establish_connection
end