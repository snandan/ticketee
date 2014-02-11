class CommentObserver < ActiveRecord::Observer
  def after_create(comment)
    (comment.ticket.watchers - [comment.user]).each do |user|
      mail1 = Notifier.comment_updated(comment, user)
      # puts "returned comment_updated"
      # puts mail1.class
      mail1.deliver
      # puts " ++++ notification delivered"
    end
  end
end
