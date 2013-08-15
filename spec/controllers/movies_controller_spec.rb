require 'simplecov'
SimpleCov.start 'rails'

require 'spec_helper'

describe MoviesController do
  describe 'find with same director' do
    it 'should call the model method that performs the search by director' do
      Movie.should_receive(:find_similar).with(:director => 'spielberg')
      post :find_similar , :director => 'spielberg'
    end
    it 'should select the similar movies template for rendering' do
      Movie.stub(:find_similar)
      post :find_similar, {:director => 'spielberg'}
      response.should render_template('similar')
    end
    it 'should make the director search results available to that template'
  end
end
