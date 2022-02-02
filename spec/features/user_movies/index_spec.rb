require 'rails_helper'

RSpec.describe 'Movie Search' do
  describe 'view' do
    before(:each) do
      @user_1 = User.create!(name: "David", email: "david@email.com")
      @party_1 = @user_1.parties.create!(duration: 180, day: "December 12, 2021", start_time: "7:00 pm", movie_id: 1, user_id: @user_1.id)
    end

    it 'shows movie details' do
      visit "/users/#{@user_1.id}/movies?query=top%40rated"

      expect(page).to have_link("The Shawshank Redemption")
      expect(page).to have_content("Vote Average: 8.7")
    end
  end
end
