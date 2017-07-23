require "sinatra"
require "./reddit"
require 'redd'
require 'pry'

get "/" do
  redirect to("/sales")
end


get "/sales" do
  session = Redd.it(
    user_agent: 'Redd:FashionTexter:v1.0.0 (by /u/the4oclockhero)',
    client_id:  'ylDT9JmKnj76CA',
    secret:     'IWeJkCkF821w05gekSpUg0CPtaM',
    username:   'the4oclockhero',
    password:   'hv3kk444'
  )
  sales = session.subreddit('frugalmalefashion').hot

  @deals = []
  sales.each do |sale|

    if sale.link_flair_text == "[Deal/Sale]"
      @deals << sale
    end
  end
  erb :deals
end


# deals.each do |deal|
#   binding.pry
#   puts "Title: #{deal.title}\n\n"
#   puts "URL: #{deal.url}\n\n"
#   puts "Created at: #{deal.created_utc}\n\n"
#   puts "Link Flair #{deal.link_flair_text}\n\n\n======================\n\n"
# end
