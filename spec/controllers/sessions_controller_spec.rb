require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

    let(:user) {
        User.create email: 'yooobuntu@163.com', password: '123123123'
    }

    let(:session_params) {
        { session: user.as_json }
    }

    describe 'POST #sign_up' do
        it 'should response success' do
            post :sign_up, params: session_params, format: :json
            debugger
            expect(response).to be_success
        end
    end
end
