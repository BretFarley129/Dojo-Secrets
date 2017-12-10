require 'rails_helper'
feature 'Login features' do
  before do
    @user = create(:user)
  end 
  feature 'Cannot access without login' do
    scenario "Secrets page" do
      visit '/secrets'
      expect(current_path).to eq('/sessions/new')
    end
    scenario "Profile" do 
      visit "/users/#{@user.id}"
      expect(current_path).to eq('/sessions/new')
    end
  end
  feature "Can access with login" do 
    before do 
      log_in
    end  
    scenario "Secrets page" do
        visit '/secrets'
        expect(current_path).to eq('/secrets')
      end
      scenario "Profile" do 
        visit "/users/#{@user.id}"
        expect(current_path).to eq("/users/#{@user.id}")
      end
  end
end