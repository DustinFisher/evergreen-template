def configure_tests_ci

  inject_into_file 'Gemfile', before: "gem 'brakeman'" do <<-'RUBY'

# Brakeman analyzes our code for security vulnerabilities
  RUBY
  end

  inject_into_file 'Gemfile', before: "gem 'bundler-audit'" do <<-'RUBY'

# bundler-audit enables bundle audit which analyzes our
# dependencies for known vulnerabilities
  RUBY
  end

end