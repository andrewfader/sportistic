require 'spec_helper'
describe Team do
  describe '.matching' do
    it 'matches on sports but not availability' do
      FactoryGirl.create(:team, sport: "Baseball", availability: [1,3])
      user = FactoryGirl.create(:user, availability: [2,4])
      user.user_sports << UserSport.new(sport: Sport.find_by_name("Baseball"))
      Team.matching(User.last).should == []
    end

    it 'matches on availability but not sports' do
      FactoryGirl.create(:team, sport: "Basketball", availability: [1,2,3])
      user = FactoryGirl.create(:user, availability: [1,2,3])
      user.user_sports << UserSport.new(sport: Sport.find_by_name("Baseball"))
      Team.matching(User.last).should == []
    end

    it 'matches on both' do
      FactoryGirl.create(:team, sport: "Baseball", availability: [0,1,4])
      user = FactoryGirl.create(:user, availability: [0,1,4])
      user.user_sports << UserSport.new(sport: Sport.find_by_name("Baseball"))
      Team.matching(User.last).should == [Team.last]
    end
  end

  describe '.associate' do
    let!(:user1) { FactoryGirl.create(:user)}
    let!(:captain) { FactoryGirl.create(:user)}
    let!(:team) { FactoryGirl.create(:team, captain_id: captain.id) }

    it 'associates' do
      user1.teams.should be_empty
      Team.associate(user1, captain.id)
      user1.teams.should == [team]
    end

    it 'is idempotent' do
      Team.associate(user1, captain.id)
      user1.teams.should == [team]
      Team.associate(user1, captain.id)
      user1.teams.should == [team]
    end
  end
end
