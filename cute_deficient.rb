require 'slack-ruby-bot'
require_relative 'cute_scraper'
require 'pry-byebug'

class CuteDeficient < SlackRubyBot::Bot
  command 'ready?' do |client, data, match|
    @thing = CuteScraper.load
    client.say(text: "meow!", channel: data.channel)
  end

  command 'meow' do |client, data, match|
    if @thing
      this_thing = @thing.sample
      @thing.delete(this_thing)
      client.say(text: @thing.sample, channel: data.channel)
    else
      client.say(text: "Sorry I'm not ready yet", channel: data.channel)
    end
  end

  command 'meow!' do |client, data, match|
    client.say(text: "mrawwww", channel: data.channel)
  end 
end

CuteDeficient.run

# SLACK_API_TOKEN=xoxb-225653507072-HzqveowT61cAqPVkSH7UIPVQ bundle exec ruby cute_deficient.rb
