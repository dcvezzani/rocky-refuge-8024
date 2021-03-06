require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe StickyNotesController do

  # This should return the minimal set of attributes required to create a valid
  # StickyNote. As you add validations to StickyNote, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { "controller" => "MyString" }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # StickyNotesController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all sticky_notes as @sticky_notes" do
      sticky_note = StickyNote.create! valid_attributes
      get :index, {}, valid_session
      assigns(:sticky_notes).should eq([sticky_note])
    end
  end

  describe "GET show" do
    it "assigns the requested sticky_note as @sticky_note" do
      sticky_note = StickyNote.create! valid_attributes
      get :show, {:id => sticky_note.to_param}, valid_session
      assigns(:sticky_note).should eq(sticky_note)
    end
  end

  describe "GET new" do
    it "assigns a new sticky_note as @sticky_note" do
      get :new, {}, valid_session
      assigns(:sticky_note).should be_a_new(StickyNote)
    end
  end

  describe "GET edit" do
    it "assigns the requested sticky_note as @sticky_note" do
      sticky_note = StickyNote.create! valid_attributes
      get :edit, {:id => sticky_note.to_param}, valid_session
      assigns(:sticky_note).should eq(sticky_note)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new StickyNote" do
        expect {
          post :create, {:sticky_note => valid_attributes}, valid_session
        }.to change(StickyNote, :count).by(1)
      end

      it "assigns a newly created sticky_note as @sticky_note" do
        post :create, {:sticky_note => valid_attributes}, valid_session
        assigns(:sticky_note).should be_a(StickyNote)
        assigns(:sticky_note).should be_persisted
      end

      it "redirects to the created sticky_note" do
        post :create, {:sticky_note => valid_attributes}, valid_session
        response.should redirect_to(StickyNote.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved sticky_note as @sticky_note" do
        # Trigger the behavior that occurs when invalid params are submitted
        StickyNote.any_instance.stub(:save).and_return(false)
        post :create, {:sticky_note => { "controller" => "invalid value" }}, valid_session
        assigns(:sticky_note).should be_a_new(StickyNote)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        StickyNote.any_instance.stub(:save).and_return(false)
        post :create, {:sticky_note => { "controller" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested sticky_note" do
        sticky_note = StickyNote.create! valid_attributes
        # Assuming there are no other sticky_notes in the database, this
        # specifies that the StickyNote created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        StickyNote.any_instance.should_receive(:update_attributes).with({ "controller" => "MyString" })
        put :update, {:id => sticky_note.to_param, :sticky_note => { "controller" => "MyString" }}, valid_session
      end

      it "assigns the requested sticky_note as @sticky_note" do
        sticky_note = StickyNote.create! valid_attributes
        put :update, {:id => sticky_note.to_param, :sticky_note => valid_attributes}, valid_session
        assigns(:sticky_note).should eq(sticky_note)
      end

      it "redirects to the sticky_note" do
        sticky_note = StickyNote.create! valid_attributes
        put :update, {:id => sticky_note.to_param, :sticky_note => valid_attributes}, valid_session
        response.should redirect_to(sticky_note)
      end
    end

    describe "with invalid params" do
      it "assigns the sticky_note as @sticky_note" do
        sticky_note = StickyNote.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        StickyNote.any_instance.stub(:save).and_return(false)
        put :update, {:id => sticky_note.to_param, :sticky_note => { "controller" => "invalid value" }}, valid_session
        assigns(:sticky_note).should eq(sticky_note)
      end

      it "re-renders the 'edit' template" do
        sticky_note = StickyNote.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        StickyNote.any_instance.stub(:save).and_return(false)
        put :update, {:id => sticky_note.to_param, :sticky_note => { "controller" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested sticky_note" do
      sticky_note = StickyNote.create! valid_attributes
      expect {
        delete :destroy, {:id => sticky_note.to_param}, valid_session
      }.to change(StickyNote, :count).by(-1)
    end

    it "redirects to the sticky_notes list" do
      sticky_note = StickyNote.create! valid_attributes
      delete :destroy, {:id => sticky_note.to_param}, valid_session
      response.should redirect_to(sticky_notes_url)
    end
  end

end
