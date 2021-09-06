def configure_environment_runtime
  remove_file 'config/database.yml'
  remove_file 'config/credentials.yml.enc'
  remove_file 'config/master.key'

  template ".env.development"
  template ".env.test"

  append_to_file '.gitignore' do
    <<-RUBY

# The .env file is used for both dev and test
# and creates more problems than it solves
.env

# .env.*.local files are where we put actual
# secrets we need for dev and test, so
# we really don't want this in version control
.env.*.local”
    RUBY
  end
end