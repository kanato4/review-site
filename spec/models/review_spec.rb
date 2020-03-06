require 'rails_helper'
describe Review do
  describe '#create' do

    #全て存在していれば登録できる
    it "is valid with a user_id, title, description, rating" do
      user = FactoryBot.create(:user)
      review = user.reviews.build(
        title: "タイトルが入ります",
        description: "説明文が入ります",
        rating: "1",
        user_id: 1
      )
      expect(review).to be_valid
    end

    #titleがないと登録できない
    it "is invalid without a title" do
      review = build(:review, title: "")
      review.valid?
      expect(review.errors[:title]).to include("を入力してください")
    end

    #titleが16文字以上は登録できない
    it "is invalid with a title that has more than 16 characters" do
      char_title = "a" * 16
      review = build(:review, title: char_title)
      review.valid?
      expect(review.errors[:title]).to include("は15文字以内で入力してください")
    end

    #titleが15文字だと登録できる
    it "is valid with a title that has less than 15 characters " do
      overchar_title = "a" * 15
      user = FactoryBot.create(:user)
      review = user.reviews.build(
        title: overchar_title,
        description: "説明文が入ります",
        rating: "1",
        user_id: 1
      )
      expect(review).to be_valid
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
      user = FactoryBot.create(:user)
      review = user.reviews.build(
        title: "タイトルが入ります",
        description: overchar_description,
        rating: "1",
        user_id: 1
      )
      expect(review).to be_valid
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