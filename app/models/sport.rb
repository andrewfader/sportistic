class Sport < ActiveHash::Base
  self.data = [
    {id: 0, name: "Baseball", positions: ["Pitcher","Catcher","1B","2B","3B","Outfield"]},
    {id: 1, name: "Basketball", positions: ["Guard","Forward","Center"]},
    {id: 2, name: "Soccer", positions: ["Goalie","Defense","Midfield","Forward"]},
    {id: 3, name: "Softball", positions: ["Pitcher","Catcher","1B","2B","3B","Outfield"]},
    {id: 4, name: "Kickball", positions: ["Pitcher","Catcher","1B","2B","3B","Outfield"]}
  ]
end
