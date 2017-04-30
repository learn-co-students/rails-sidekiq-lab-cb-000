class SongsWorker
  include Sidekiq::Worker
  require 'csv'

  def perform(file)
    CSV.foreach(file, headers: true) do |file|
      Song.create(title: file[0], artist_name: file[1])
    end
  end
end
