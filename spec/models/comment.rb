require 'rails_helper'

describe Comment do
  describe "relationships" do
    it "belongs to a job" do
      comment = Comment.new(author: "me", body: "love this article")

      expect(comment).to respond_to(:job)
    end
  end

  describe "validations" do
    it "is invalid without an author"
    job = Job.build()
    comment = Comment.new(body: "love this article", job: job.id)

    expect(comment).to be_invalid
  end

  it "is invalid without a body" do
  job = Job.build()
  comment = Comment.new(author: "me", job: job.id)

  expect(comment).to be_invalid
end

  it "is invalid without a job" do
  comment = Comment.new(author: "me", body: "love this article")

  expect(comment).to be_invalid
  end
end
