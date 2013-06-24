require 'spec_helper'
describe Team do
  describe '#matching' do
    it 'matches on sports but not availability' do
      Team.create!(name: 'foo', location: 'bar', sport: 1, availability: [1,3])
      User.create!(email: "foo@bar.com", password: 'foobar', sports: 1, availability: [2,4])
      Team.matching(User.last).should == []
    end
    it 'matches on availability but not sports' do
      Team.create!(name: 'foo', location: 'bar', sport: 1, availability: [1,2,3])
      User.create!(email: "foo@bar.com", password: 'foobar', sports: 2, availability: [1,2,3])
      Team.matching(User.last).should == []
    end
    it 'matches on both' do
      Team.create!(name: 'foo', location: 'bar', sport: 1, availability: [0,1,4])
      User.create!(email: "foo@bar.com", password: 'foobar', sports: 1, availability: [1,2,3])
      Team.matching(User.last).should == [Team.last]
    end
  end
end
