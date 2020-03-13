require 'rails_helper'

RSpec.describe Api::V1::MoviesController, type: :controller do

  let!(:movie_one) { create(:batman_one) }

  let!(:movie_two) { create(:batman_two) }

  let!(:movie_three) { create(:batman_three) }

  let!(:valid_put_params) do
    {
      id:           movie_one.id,
      title:        'newMovie',
      release_year: 2020
    }
  end

  let!(:invalid_put_params) do
    {
      id:           movie_one.id,
      title:        nil,
      release_year: ''
    }
  end

  let!(:valid_post_params) do
    {
      title:        'newMovie2',
      release_year: 2021
    }
  end

  let!(:invalid_post_params) do
    {
      title:        nil,
      release_year: ''
    }
  end

  context 'when call show' do
    it 'responds successfully with an HTTP 200 status code' do
      get :show, params: { id: movie_one.id }
      expect(response).to be_successful
      expect(response).to have_http_status(200)
    end

    it 'return movie' do
      get :show, params: { id: movie_one.id }
      expect(json['id']).to eq(movie_one.id)
      expect(json['title']).to eq(movie_one.title)
    end
  end

  context 'when call update with valid params' do
    it 'responds successfully with an HTTP 200 status code' do
      put :update, params: valid_put_params
      expect(response).to be_successful
      expect(response).to have_http_status(200)
    end

    it 'should update the movie' do
      put :update, params: valid_put_params
      movie = Movie.find(valid_put_params[:id])
      expect(movie.title).to eq(valid_put_params[:title])
    end
  end

  context 'when call update with INVALID params' do
    it 'responds successfully with an HTTP 200 status code' do
      put :update, params: invalid_put_params
      expect(response).to have_http_status(422)
    end

    it 'should NOT update the movie' do
      put :update, params: invalid_put_params
      expect(json['title']).to eq(["can't be blank"])
      expect(json['release_year']).to eq(['is not a number'])
    end
  end

  context 'when call post with valid params' do
    it 'responds successfully with an HTTP 200 status code' do
      post :create, params: valid_post_params
      expect(response).to be_successful
      expect(response).to have_http_status(200)
    end

    it 'should create new movie' do
      number_of_movies = Movie.all.count
      post :create, params: valid_post_params
      expect(Movie.all.count).to eq(number_of_movies + 1)
    end
  end

  context 'when call post with INVALID params' do
    it 'responds successfully with an HTTP 200 status code' do
      post :create, params: invalid_post_params
      expect(response).to have_http_status(422)
    end

    it 'should create new movie' do
      number_of_movies = Movie.all.count
      post :create, params: invalid_post_params
      expect(Movie.all.count).to eq(number_of_movies)
    end
  end

  context 'when call index' do
    it 'responds successfully with an HTTP 200 status code' do
      get :index
      expect(response).to be_successful
      expect(response).to have_http_status(200)
    end

    it 'return all movies' do
      get :index
      expect(json.count).to eq(3)
    end
  end

  private

  def json
    JSON.parse(response.body)
  end

end