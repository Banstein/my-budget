require 'rails_helper'

RSpec.describe 'Group', type: :request do
  describe 'GET #index' do
    before(:example) { get groups_path }

    it 'returns http found' do
      expect(response).to have_http_status(:ok)
    end
    it "renders 'index' template" do
      expect(response).to render_template('index')
    end
    it 'includes the correct placeholder text' do
      expect(response.body).to include 'Categories'
    end
    it 'response body includes correct title' do
      expect(response.body.include?('Categories')).to be_truthy
    end
  end
end
