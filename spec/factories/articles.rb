FactoryBot.define do
  # factory :article do
  #   title { "Sample article" }
  #   content { "Sample content" }
  #   slug { "sample-article" }
  # end

  factory :article do
    sequence(:title) { |n| "Sample article #{n}" }
    content { "Sample content" }
    sequence(:slug) { |n| "sample-article-#{n}" }
  end
end
