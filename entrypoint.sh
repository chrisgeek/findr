set -e 

# If the database exists, migrate. Otherwise setup #(create and migrate) 

bundle exec rake db:migrate 2>/dev/null || bundle exec 

rake db:create db:migrate echo "Database has been created & migrated!"

# Remove server.pid if it exists 

rm -f /findr/tmp/pids/server.pid
