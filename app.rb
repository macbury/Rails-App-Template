git :init
file ".gitignore", <<-END
.DS_Store
log/*.log
tmp/**/*
public/*.xml.gz
config/database.yml
db/*.sqlite3
END

run "touch tmp/.gitignore log/.gitignore vendor/.gitignore"
run "cp config/database.yml config/example_database.yml"

run "rm -r public/javascripts"
run "mkdir public/javascripts"

git :add => ".", :commit => "-m 'Initial commit'"

run "cp -R ../app_template/template/ ."

gem "authlogic"
gem "searchlogic"
gem "declarative_authorization"
gem 'meta-tags', :lib => 'meta_tags', :source => 'http://gemcutter.org'
gem 'less', :lib => false, :source => "http://gemcutter.org"
gem 'sitemap_generator', :lib => false, :source => 'http://gemcutter.org'

plugin 'more', :git => 'git://github.com/cloudhead/more.git'
plugin 'xss_terminate', :git => 'git://github.com/look/xss_terminate.git'
plugin 'will_paginate', :git => 'git://github.com/mislav/will_paginate.git'
plugin 'permalink_fu', :git => 'git://github.com/technoweenie/permalink_fu.git'
plugin 'formtastic', :git => 'git://github.com/justinfrench/formtastic.git'
plugin 'whiny_finder', :git => "git://github.com/lsegal/whiny_finder.git"

git :add => ".", :commit => "-m 'Golonkam flaki i inne przysmaki'"

generate :session, 'user_session'
generate :formtastic

run "rake sitemap:install"

git :add => ".", :commit => "-m 'Logowanie i rejestracja'"

run "mate ."
run "mate config/database.yml"