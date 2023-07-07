require_relative '../classes/music_album'
require_relative './genre_options'
require_relative './author_options'

class MusicOptions
  attr_accessor :music_instances, :music_ruby_objects

  def initialize
    @music_instances = []
    @music_ruby_objects = []
  end

  def to_ruby_object(music)
    {
      id: music.id,
      on_spotify: music.on_spotify,
      publish_date: music.publish_date
    }
  end

  def list_musics
    puts "\n♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪"
    puts "\n🚀 Listing musics... ♫"
    puts ''
    sleep(0.5)
    if @music_ruby_objects.empty?
      puts "\n♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪"
      puts '||                                                                  ||'
      puts '||                         No musics found 😿                        ||'
      puts '||                                                                  ||'
      puts '♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪'
    else
      @music_ruby_objects.each_with_index do |music, i|
        id = music["id"]
        on_spotify = music["on_spotify"]
        name = music["name"]
        publish_date = music["publish_date"]
        
        puts "[ ♪ #{i}] ID: #{id} - Music name: #{name} - Is on spotify ? : #{on_spotify} - Publish Date: #{publish_date}"
      end
      puts "\n♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪"
    end
    puts ''
  end

  def add_music(genre_options, author_options)
    puts ''
    puts '🚀 Adding a music...  ♫'
    sleep(0.5)
    puts "\n♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪
    "
    puts ''
    puts 'What is the name of the music?'
    music_name = gets.chomp
    puts 'What is the publish date? (YYYY-MM-DD)'
    publish_date = gets.chomp
    puts 'Is the music on Spotify? (Y/N): '
    on_spotify = gets.chomp.downcase == 'y'
    new_music = Music.new(music_name, publish_date, on_spotify)
    @music_ruby_objects.push(to_ruby_object(new_music))
    genre_options.add_genre(new_music)
    author_options.add_author(new_music)
    sleep(0.3)
    puts "\n======================================================================"
    puts '||                                                                  ||'
    puts '||                          😺 Author added! 📕                     ||'
    puts '||                          😺 genre added! 📕                      ||'
    sleep(0.3)
    puts '||                          ♫ music was added! 😼                    ||'
    puts '||                                                                  ||'
    puts '======================================================================'
    puts ''
  end
end
