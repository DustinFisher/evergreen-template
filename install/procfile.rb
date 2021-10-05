def configure_procfile
  gsub_file 'Procfile.dev', /web: bin\/rails server -p 3000/, 'web: bin/rails server -b 0.0.0.0 -p 3000' 
end
