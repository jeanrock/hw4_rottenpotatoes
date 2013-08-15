require 'simplecov'
SimpleCov.start 'rails'

require 'spec_helper'

describe MoviesController do
  describe 'find with same director' do
    it 'should call the model method that performs the search by director' do
      Movie.should_receive(:find_by_director).with('spielberg')
      post :find_with_same_director , :director => 'spielberg'
    end
    it 'should select the Director template for rendering'
    it 'should make the director search results available to that template'
  end
end
