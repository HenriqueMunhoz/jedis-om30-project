require 'rails_helper'

RSpec.describe MunicipesController do
  describe 'GET #index' do
    it 'assigns @municipes' do
      municipes = create_list(:municipe, 3)
      get :index
      expect(assigns(:municipes).results.to_a).to match_array(municipes)
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #new' do
    it 'assigns a new Municipe to @municipe' do
      get :new
      expect(assigns(:municipe)).to be_a_new(Municipe)
    end

    it 'builds a new Address for @municipe' do
      get :new
      expect(assigns(:municipe).address).to be_a_new(Address)
    end

    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new Municipe' do
        expect do
          post :create, params: { municipe: attributes_for(:municipe) }
        end.to change(Municipe, :count).by(1)
      end

      it 'redirects to the index page' do
        post :create, params: { municipe: attributes_for(:municipe) }
        expect(response).to redirect_to(municipes_path)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Municipe' do
        expect do
          post :create, params: { municipe: attributes_for(:municipe, full_name: nil) }
        end.not_to change(Municipe, :count)
      end

      it 'renders the new template' do
        post :create, params: { municipe: attributes_for(:municipe, full_name: nil) }
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'GET #edit' do
    let(:municipe) { create(:municipe) }

    it 'assigns the requested Municipe to @municipe' do
      get :edit, params: { id: municipe.id }
      expect(assigns(:municipe)).to eq(municipe)
    end

    it 'renders the edit template' do
      get :edit, params: { id: municipe.id }
      expect(response).to render_template(:edit)
    end
  end

  describe 'PATCH #update' do
    let(:municipe) { create(:municipe) }

    context 'with valid parameters' do
      it 'updates the requested Municipe' do
        patch :update, params: { id: municipe.id, municipe: { full_name: 'New Name' } }
        municipe.reload
        expect(municipe.full_name).to eq('New Name')
      end

      it 'redirects to the index page' do
        patch :update, params: { id: municipe.id, municipe: { full_name: 'New Name' } }
        expect(response).to redirect_to(municipes_path)
      end
    end

    context 'with invalid parameters' do
      it 'does not update the requested Municipe' do
        patch :update, params: { id: municipe.id, municipe: { full_name: nil } }
        municipe.reload
        expect(municipe.full_name).not_to be_nil
      end

      it 'renders the edit template' do
        patch :update, params: { id: municipe.id, municipe: { full_name: nil } }
        expect(response).to render_template(:edit)
      end
    end
  end
end
