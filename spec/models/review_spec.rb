require 'rails_helper'
describe Review do
  describe '#create' do

    #全て存在していれば登録できる
    it "is valid with a review" do
      review = FactoryBot.build(:review)
      post_review = FactoryBot.build(:image)
      expect(post_review).to be_valid
    end

    #titleがないと登録できない
    it "is invalid without a title" do
      review = build(:review, title: "")
      review.valid?
      expect(review.errors[:title]).to include("を入力してください")
    end

    #titleが21文字以上は登録できない
    it "is invalid with a title that has more than 21 characters" do
      overchar_title = "a" * 21
      review = build(:review, title: overchar_title)
      review.valid?
      expect(review.errors[:title]).to include("は20文字以内で入力してください")
    end

    #titleが20文字だと登録できる
    it "is valid with a title that has less than 20 characters " do
      char_title = "a" * 20
      review = FactoryBot.build(:review, title: char_title)
      post_review = FactoryBot.build(:image)
      expect(post_review).to be_valid
    end

    #descriptionがないと登録できない
    it "is invalid without a description" do
      review = build(:review, description: "")
      review.valid?
      expect(review.errors[:description]).to include("を入力してください")
    end

    #descriptionが301文字以上は登録できない
    it "is invalid with a description that has more than 301 characters" do
      char_description = "a" * 301
      review = build(:review, description: char_description)
      review.valid?
      expect(review.errors[:description]).to include("は300文字以内で入力してください")
    end

    #descriptionが300文字だと登録できる
    it "is valid with a description that has less than 300 characters " do
      overchar_description = "a" * 300
      review = FactoryBot.build(:review, description: overchar_description)
      post_review = FactoryBot.build(:image)
      expect(post_review).to be_valid
    end
    
    # statusがないと登録できない
    it "is invalid without a status" do
      review = build(:review, status: "")
      review.valid?
      expect(review.errors[:status]).to include("を入力してください")
    end

    # ratingがないと登録できない
    it "is invalid without a rating" do
      review = build(:review, rating: "")
      review.valid?
      expect(review.errors[:rating]).to include("を入力してください")
    end

    # user_idがないと登録できない
    it "is invalid without a user_id" do
      review = build(:review, user_id: "")
      review.valid?
      expect(review.errors[:user_id]).to include("を入力してください")
    end
  end
end