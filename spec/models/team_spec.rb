require 'spec_helper'
describe Team do
  describe '.matching' do
    it 'matches on sports but not availability' do
      FactoryGirl.create(:team, sport: 1, availability: [1,3])
      FactoryGirl.create(:user, sports: 1, availability: [2,4])
      Team.matching(User.last).should == []
    end

    it 'matches on availability but not sports' do
      FactoryGirl.create(:team, sport: 1, availability: [1,2,3])
      FactoryGirl.create(:user, sports: 2, availability: [1,2,3])
      Team.matching(User.last).should == []
    end

    it 'matches on both' do
      FactoryGirl.create(:team, sport: 1, availability: [0,1,4])
      FactoryGirl.create(:user, sports: 1, availability: [0,1,4])
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
