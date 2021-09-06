
def run_template!
  add_template_repository_to_source_path

  add_gems

  after_bundle do
    configure_environment_runtime
    configure_docker

    initial_project_commit_and_branch
  end
end

def initial_project_commit_and_branch
  git :init
  git branch: "-m master main"
end

# Pulled this function from https://github.com/mattbrictson/rails-template
# and modified it for including install files
def add_template_repository_to_source_path
  if __FILE__ =~ %r{\Ahttps?://}
    source_paths.unshift(tempdir = Dir.mktmpdir('evergreen-'))
    at_exit { FileUtils.remove_entry(tempdir) }
    git clone: [
      '--quiet',
      'https://github.com/dustinfisher/evergreen-template.git',
      tempdir
    ].map(&:shellescape).join(' ')

    Dir[File.join(tempdir, 'install', '*.rb')].each { |file| require file }
  else
    source_paths.unshift(File.dirname(__FILE__))
    Dir[File.join(__dir__, 'install', '*.rb')].each { |file| require file }
  end
end

run_template!