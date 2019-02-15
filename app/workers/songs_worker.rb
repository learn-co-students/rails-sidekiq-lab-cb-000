class SongsWorker
  require 'csv'
  include Sidekiq::Worker
 
  def perform(file)
    CSV.foreach(file, headers: true) do |sng|
      Song.create(title: sng[0], artist_name: sng[1])
    end
  end
end

