git :init
file ".gitignore", <<-END
.DS_Store
log/*.log
tmp/**/*
config/database.yml
db/*.sqlite3
END

run "touch tmp/.gitignore log/.gitignore vendor/.gitignore"
run "cp config/database.yml config/example_database.yml"
run "cp ../template/application_controller.rb app/controllers/application_controller.rb"
run "mkdir db/migrate"
run "cp ../template/20091026164433_create_users.rb db/migrate/20091026164433_create_users.rb"

git :add => "."
git :commit => "-m 'Initial commit'"

gem "authlogic"
gem "searchlogic"

plugin 'xss_terminate', :git => 'git://github.com/look/xss_terminate.git'
plugin 'will_paginate', :git => 'git://github.com/mislav/will_paginate.git'
plugin 'conditions_fu', :git => 'git://github.com/nesquena/conditions_fu.git'
plugin 'permalink_fu', :git => 'git://github.com/technoweenie/permalink_fu.git'
plugin 'formtastic', :git => 'git://github.com/justinfrench/formtastic.git'

git :add => ".", :commit => "-m 'Standardowe pluginy'"

generate :nifty_scaffold, "user email:string password:string password_confirmation:string new edit --skip-migration"
generate :session, 'user_session'
generate :nifty_scaffold, 'user_session --skip-model username:string password:string new destroy'
generate :formtastic

git :add => ".", :commit => "-m 'Logowanie i rejestracja'"

require 'net/http'

Net::HTTP.start("github.com") do |http|
  resp = http.get("/svenfuchs/rails-i18n/raw/master/rails/locale/pl.yml")
  open("config/locales/pl.yml", "wb") do |file|
    file.write(resp.body)
  end
end

git :add => ".", :commit => "-m 'Spolszczenie...'"

run "mate ."
run "mate config/database.yml"