# app class
require 'io/console'
class App
  def display_options
    puts 'Welcome to your catalog manager\n\n'
    puts 'Choose a catagory'
    puts '1 - Books'
    puts '2 - Music albums'
    puts '3 - Games'
    puts ''
    puts 'You can\'t choose now. App is still in development state.\n\n'
    print 'Press any key to close the app... '
  end

  def run
    display_options
    $stdin.getch
    puts ''
  end
end
