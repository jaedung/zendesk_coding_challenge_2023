require 'tty-prompt'
require 'json'

require_relative 'menu'

class App
  def initialize
  end

  def run
    welcome_text

    menu = Menu.new(prompt)

    loop do
      input = prompt.yes?('Do you like to continue searching on Zendesk?')
      puts

      case input
      when true
        menu.entities_search_menu
      when false
        puts 'Bye, see you again!'
        break
      end
    end
  end

  private

  def prompt
    @prompt ||= TTY::Prompt.new
  end

  def welcome_text
    puts <<-'ASCII'
    ______              _           _       _____                     _     
   |___  /             | |         | |     / ____|                   | |    
      / / ___ _ __   __| | ___  ___| | __ | (___   ___  __ _ _ __ ___| |__  
     / / / _ \ '_ \ / _` |/ _ \/ __| |/ /  \___ \ / _ \/ _` | '__/ __| '_ \ 
    / /_|  __/ | | | (_| |  __/\__ \   <   ____) |  __/ (_| | | | (__| | | |
   /_____\___|_| |_|\__,_|\___||___/_|\_\ |_____/ \___|\__,_|_|  \___|_| |_|'
   ASCII

    puts
    puts 'Welcome to Zendesk Search!'
    puts
  end
end

if ENV['TEST'] != 'true'
  app = App.new
  app.run
end
