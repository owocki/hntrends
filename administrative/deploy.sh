cd /home/rails
git add .
git stash
git pull origin master
bundle install
RAILS_ENV=production bundle exec rake assets:precompile
service unicorn reload
crontab administrative/crontab.txt
chmod 777 public/page_cache/* -R
