require'rails_helper'

RSpec.describe UsersController, type: :controller do
 let( :user0 ){ create(:user) }
  context 'GET#index' do
    it 'returns a success response' do
      get :index
      expect(response.status).to eq 200
    end
  end

  context 'GET#show' do
    let(:user) { create(:user) }
    it 'returns a success response' do
      get :show, params: {id: user.to_param}
      expect(response.status).to eq 200
    end

    it 'should return the users show template' do
      get :show, params: { id: user.id }
      expect(response).to render_template :show
    end
  end

  describe'GET#new'do
    it "assigns a new Contact to @contact" do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  context 'GET #edit' do
    it 'assigns the edited requested user to the @user'  do
      user = create(:user)
      get :edit, params: { id: user.to_param }
      expect(assigns(:user)).to eq user
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      let(:valid_attributes) { attributes_for(:user) }

      it 'saves the new user in the database' do
        expect {
          post :create, params: { user: valid_attributes }
        }.to change(User, :count).by(1)
      end
    end
  end

 describe 'PATCH #update' do
   context 'with valid attributes' do
     let(:valid_attributes) do
       attributes_for(:user,
                      name: 'Science',
                      age: 52,
                      email: 'General Science@da.gh')
     end

     it 'locates the requested course' do
       patch :update, params: { id: user0, user: valid_attributes }
       expect(assigns(:user)).to eq(user0)
     end

     it 'updates the new course in the database' do
       patch :update, params: { id: user0, user: valid_attributes }
       user0.reload
       expect(user0.name).to eq('Science')
       expect(user0.age).to eq(52)
       expect(user0.email).to eq('General Science@da.gh')
     end

     it 'redirects to the updated courses#index' do
       patch :update, params: { id: user0, user: valid_attributes }
       expect(response).to redirect_to user_path(user0)
     end
   end
end

 describe 'DELETE #destroy' do
   it 'deletes the course from the database' do
     user0
     expect {
       delete :destroy, params: { id: user0 }
     }.to change(User, :count).by(-1)
   end

   it 'redirects to Courses#index' do
     delete :destroy, params: { id: user0 }
     expect(response).to redirect_to users_path
   end
 end

end



