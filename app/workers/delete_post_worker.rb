class DeletePostWorker
  include Sidekiq::Worker

  def perform(post)
	Post.find(post).destroy
  end
end
