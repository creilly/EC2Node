set :node_env, 'acceptance'
set :branch, 'deployment'
set :keep_releases, 10

server 'ec2-184-72-12-121.us-west-1.compute.amazonaws.com', :web, :app, :db, :primary => true
