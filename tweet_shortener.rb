require 'pry'

def dictionary
  dict = {
    "hello" => "hi",
    "to" => "2", "two" => "2", "too" => "2",
    "for" => "4", "four" => "4",
    "be" => "b",
    "you" => "u",
    "at" => "@",
    "and" => "&"
  }
end


def word_substituter(tweet)
  dict = dictionary
  i = 0
  split_tweet = tweet.split
  while i < split_tweet.count
    split_tweet[i] = dict[split_tweet[i].downcase] if dict[split_tweet[i].downcase]
    i += 1
  end
  return_tweet = split_tweet.join(" ")
end


def bulk_tweet_shortener(array_of_tweets)
  array_of_tweets.each {|tweet| puts word_substituter(tweet)}
end


def selective_tweet_shortener(tweet)
  tweet = word_substituter(tweet) if tweet.length >= 140
  tweet
end


def shortened_tweet_truncator(tweet)
  return tweet if tweet.length < 141
  split_tweet = tweet.split(/\W+/)
  return_tweet = ""
  split_tweet.collect do |word|
    if return_tweet.length + word.length < 136
      return_tweet << " " << word
    else
      return_tweet << " ..."
      return return_tweet
    end
  end
  return_tweet << " ..."

end

tweet_4 = "GUISEEEEE this is so fun! I'm tweeting for you guys and this tweet is SOOOO long it's gonna be way more than you would think twitter can handle, so shorten it up you know what I mean? I just can never tell how long to keep typing!"
tweet_5 = "Hey guys, can anyone teach me how 2 b cool? I really want 2 b the best @ everything, u know what I mean? Tweeting is super fun u guys!!!!"

puts shortened_tweet_truncator(tweet_4).length
