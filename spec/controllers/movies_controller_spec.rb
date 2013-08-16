require 'simplecov'

SimpleCov.start 'rails'

require 'spec_helper'

describe MoviesController do
  describe 'I should be able to see movies with the same director' do
    it 'should call the movies model method tha searchs movies by the same director'do
      Movie.should_receive(:find_all_by_director).with("spielberg")
      post :find_similar , :director => "spielberg"
    end
    it 'should render the similar movies template' do
      Movie.stub(:find_all_by_director)
      response.should render_template('similar_movies')
    end

    it 'should make similar movies available to that template'
  end
end
