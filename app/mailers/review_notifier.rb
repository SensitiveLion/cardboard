class ReviewNotifier < ApplicationMailer
  def new_review(review)
    @review = review
    mail(
          to: review.game.user.email,
          subject: "New Review for #{review.game.name}"
        )
  end
end
