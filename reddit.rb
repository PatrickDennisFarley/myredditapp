require 'redd'
require 'date'
require 'pry'

session = Redd.it(
  user_agent: 'Redd:FashionTexter:v1.0.0 (by /u/the4oclockhero)',
  client_id:  'ylDT9JmKnj76CA',
  secret:     'IWeJkCkF821w05gekSpUg0CPtaM',
  username:   'the4oclockhero',
  password:   'hv3kk444'
)
#
# session.subreddit('all').post_stream do |submission|
#   # if post.body.include?('roll a dice')
#   #   puts "Found text"
#   # elsif post.body.include?('flip a coin')
#   #   puts "Found second text"
#   # end
#
#   puts submission.to_s
# end

# sales = session.subreddit('frugalmalefashion').search("sale")
# (search for a string in the subreddt)

# sales = session.subreddit('frugalmalefashion').post_stream
# returns an array of all the Submissions from the FMF subreddit in descending order


# keywords = ["Jordan", "Eagle", "Notre"]
#
# keywords.each do |keyword|
#
#   sales = session.subreddit('frugalmalefashion').search(keyword)
# binding.pry
#   sales.each do |sale|
#     puts "Title: #{sale.title}\n\n"
#     puts "URL: #{sale.url}\n\n"
#     puts "Created at: #{sale.created_utc}\n\n\n"
#   end
#
# end

# sales = session.subreddit('frugalmalefashion').search("Jordan")
#
# sorted_sales = sales.sort_by { |obj| obj.created }
# rev_sorted_sales = sorted_sales.reverse
# rev_sorted_sales.each do |sale|
#   puts "Title: #{sale.title}\n\n"
#   puts "URL: #{sale.url}\n\n"
#   puts "Created at: #{sale.created_utc}\n\n\n"
# end
# This sets a sorted list of results from a certain string from newest to oldest


sales = session.subreddit('frugalmalefashion').hot

deals = []
sales.each do |sale|

  if sale.link_flair_text == "[Deal/Sale]"
    deals << sale
  end
end

deals.each do |deal|
  puts "Title: #{deal.title}\n\n"
  puts "URL: #{deal.url}\n\n"
  puts "Created at: #{deal.created_utc}\n\n"
  puts "Link Flair #{deal.link_flair_text}\n\n\n======================\n\n"
end
