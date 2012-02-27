# encoding: UTF-8
require 'rubygems'
require 'bundler'
Bundler.require

SchnitzelPress.mongo_uri = case SchnitzelPress.env
  when "development" then 'mongodb://localhost/my-schnitzelpress-blog'
  when "production"  then ENV['MONGOLAB_URI'] || ENV['MONGOHQ_URL'] || ENV['MONGO_URL']
end

class App < SchnitzelPress::App
  configure do
    set :blog_title, "My New Blog"
    set :blog_description, "A new blog powered by SchnitzelPress."
    set :author_name, "Your Name"
    set :footer, "powered by [SchnitzelPress #{SchnitzelPress::VERSION}](http://schnitzelpress.org)"

    # Set :uid to your email address. Only the user with this email address
    # will be able to log into the administration section of your blog.
    #
    set :administrator, {
      :provider => "browser_id",  # don't change this. (for now.)
      :uid      => "your@email.com"
    }

    # The following are optional:
    #
    # set :disqus_name, "..."
    # set :google_analytics_id, "..."
    # set :gauges_id, "..."
    # set :twitter_id, '...'
    # set :read_more, "Read ALL the things"
  end
end
