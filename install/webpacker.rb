def configure_webpacker
  gsub_file 'Gemfile', /gem 'webpacker', '~> 5.0'/, "gem 'webpacker', '~> 6.0'"

  run "bin/rails webpacker:install"
  run 'yarn add @rails/webpacker@6.0.0-rc.5 webpack@latest webpack-cli@latest'
  run 'yarn add webpack-dev-server@latest -D'
end