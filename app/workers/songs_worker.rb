class SongsWorker
  require 'csv'
  include Sidekiq::Worker

  def perform(songs_file)
    # binding.pry
    CSV.foreach(songs_file, headers: true) do |song|
      song = Song.create(title: song[0])
      song.build_artist(name: song[1])
    end
  end
end
