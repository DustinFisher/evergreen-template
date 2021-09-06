def configure_logs
  copy_file "config/initializers/lograge.rb"

  inject_into_file 'Gemfile', before: "gem 'lograge'" do <<-'RUBY'

# lograge changes Rails' logging to a more
# traditional one-line-per-event format
  RUBY
  end
end