require 'rails_helper'

RSpec.describe Article, type: :model do
  describe '#validations' do
    # article = create(:article) # Can remove the FactoryBot part FactoryBot.create(:article)
    let(:article) { build(:article) } # For fast tests, use build instead of create and use let instead for all the test cases!

    it "tests that factory article is valid" do
      expect(article).to be_valid
      article.save
      another_article = build(:article)
      expect(another_article).to be_valid
    end

    it "tests that factory article has invalid title" do
      article.title = ''
      expect(article).to_not be_valid
      expect(article.errors.messages[:title]).to include("can't be blank")
    end

    it "tests that factory article has invalid content" do
      article.content = ''
      expect(article).to_not be_valid
      expect(article.errors.messages[:content]).to include("can't be blank")
    end

    it "tests that factory article has invalid slug" do
      article.slug = ''
      expect(article).to_not be_valid
      expect(article.errors.messages[:slug]).to include("can't be blank")
    end

    it "tests that factory article has unique slug" do
      article.save
      expect(article).to be_valid
      article2 = build(:article, slug: article.slug)
      expect(article2).to_not be_valid
      expect(article2.errors.messages[:slug]).to include("has already been taken")
    end
  end
end
