require "sinatra"
require "./reddit"
require 'redd/middleware'
require 'pry'

use Rack::Session::Cookie
use Redd::Middleware,
user_agent:   'Redd:Username FashionTexter:v1.0.0 (by /u/the4oclockhero)',
client_id:    'ylDT9JmKnj76CA',
secret:       'IWeJkCkF821w05gekSpUg0CPtaM',
redirect_uri: 'http://localhost:4567/auth/reddit/callback',
scope:        %w(identity),
via:          '/auth/reddit'
# username:   'the4oclockhero',
# password:   'hv3kk444'

get "/" do
  redirect to("/sales")
end


get "/sales" do
  sales = request.env['redd.session']
  sales.each do |sale|
    "Title: #{sale.title}\n\nURL: #{sale.url}\n\n\n"
  end
end

get '/auth/reddit/callback' do
  redirect to('/') unless request.env['redd.error']
  "Error: #{request.env['redd.error'].message} (<a href='/'>Back</a>)"
end





# sales = reddit.subreddit('frugalmalefashion').hot
# sales = session.subreddit('frugalmalefashion').hot
