def configure_docker
  copy_file 'bin/setup', force: true
  copy_file 'Dockerfile'

  template "docker-compose.yml"

  inject_into_file 'Gemfile', before: "gem 'dotenv-rails', groups: [:development, :test]" do <<-'RUBY'

# All runtime config comes from the UNIX environment
# but we use dotenv to store that in files for
# development and testing
  RUBY
  end
end