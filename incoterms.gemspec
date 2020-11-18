require_relative 'lib/incoterms/version'

Gem::Specification.new do |spec|
  spec.name          = 'incoterms'
  spec.version       = Incoterms::VERSION
  spec.authors       = ['Diego Orejuela']
  spec.email         = ['dfrodriguezor@gmail.com']

  spec.summary       = 'Information in ruby about Incoterms (International Commercial Terms)'
  spec.description   = 'Information in ruby about Incoterms (International Commercial Terms)'
  spec.homepage      = 'https://github.com/rocket-co/incoterms'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

  spec.metadata['allowed_push_host'] = 'http://mygemserver.com'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/rocket-co/incoterms'
  spec.metadata['changelog_uri'] = 'https://github.com/rocket-co/incoterms'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z data/*`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
end
