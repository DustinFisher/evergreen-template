def add_gems
  # All runtime config comes from the UNIX environment
  # but we use dotenv to store that in files for
  # development and testing
  gem "dotenv-rails", groups: [:development, :test]
end
