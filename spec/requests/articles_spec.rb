require 'rails_helper'

RSpec.describe ArticlesController, type: :request do
  describe '#index' do
    it 'returns a successful response' do
      get '/articles'
      # expect(response).to be_successful
      expect(response).to have_http_status(:ok)
      # expect(response.status).to eq(200)
    end

    it 'returns a proper JSON' do
      article = create(:article)
      get '/articles'
      expect(json_data.length).to eq(1)
      expected = json_data.first
      aggregate_failures do
        expect(expected[:id]).to eq(article.id.to_s)
        expect(expected[:type]).to eq('article')
        expect(expected[:attributes]).to eq({
          title: article.title,
          content: article.content,
          slug: article.slug
        })
      end
    end
  end

  # describe '#show' do
  #   let(:article) { create(:article) }

  #   it 'returns a successful response' do
  #     get "/articles/#{article.id}"
  #     expect(response).to be_successful
  #   end

  #   it 'returns a proper JSON' do
  #     get "/articles/#{article.id}"
  #     json = JSON.parse(response.body)
  #     pp json
  #     # json_data = json['data']
  #     # expect(json_data['id']).to eq(article.id.to_s)
  #     # expect(json_data['type']).to eq('article')
  #     # expect(json_data['attributes']).to eq({
  #     #   'title' => article.title,
  #     #   'content' => article.content,
  #     #   'slug' => article.slug
  #     # })
  #   end
  # end

  # describe '#create' do
  #   let(:article) { build(:article) }

  #   it 'returns a successful response' do
  #     post '/articles', params: { article: article.attributes }
  #     expect(response).to be_successful
  #   end

  #   it 'returns a proper JSON' do
  #     post '/articles', params: { article: article.attributes }
  #     json = JSON.parse(response.body)
  #     pp json
  #     # json_data = json['data']
  #     # expect(json_data['type']).to eq('article')
  #     # expect(json_data['attributes']).to eq({
  #     #   'title' => article.title,
  #     #   'content' => article.content,
  #     #   'slug' => article.slug
  #     # })
  #   end
  # end
end
