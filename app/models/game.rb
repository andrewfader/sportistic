class Game < ActiveRecord::Base
  has_many :user_games
  has_many :users, through: :user_games
  belongs_to :team
  belongs_to :vs_team, class_name: Team
  belongs_to :creator, class_name: User
  validates_presence_of :team_id, :start, :location
  geocoded_by :location
  after_validation :geocode

Game::LOCATIONS = JSON.parse("[\"Allerton\",\"Alphabet City\",\"Arden Heights\",\"Arlington\",\"Astoria\",\"Auburndale\",\"Baisley Park\",\"Bath Beach\",\"Bathgate\",\"Battery Park City\",\"Bay Ridge\",\"Bay Terrace\",\"Bay Terrace\",\"Baychester\",\"Bayside\",\"Bayswater\",\"Bedford Park\",\"Bedford-Stuyvesant\",\"Beechhurst\",\"Belle Harbor\",\"Bellerose\",\"Belmont\",\"Bensonhurst\",\"Bensonhurst\",\"Bergen Beach\",\"Bloomfield\",\"Boerum Hill\",\"Breezy Point\",\"Briarwood\",\"Brighton Beach\",\"Bronx River\",\"Bronxdale\",\"Brooklyn Heights\",\"Brooklyn Navy Yard\",\"Brookville\",\"Brownsville\",\"Bruckner\",\"Bulls Heads\",\"Bushwick\",\"Cambria Heights\",\"Carroll Gardens\",\"Castle Hill\",\"Castleton Corners\",\"Charleston\",\"Chelsea\",\"Chelsea\",\"Chinatown\",\"City Island\",\"City Line\",\"Claremont\",\"Clason Point\",\"Clifton\",\"Clinton\",\"Clinton Hill\",\"Co-op City\",\"Cobble Hill\",\"College Point\",\"Concord\",\"Concourse\",\"Concourse Village\",\"Coney Island\",\"Corona\",\"Crotona Park\",\"Crown Heights\",\"Crown Heights\",\"Cunningham Heights\",\"Cypress Hills\",\"DUMBO\",\"Ditmars\",\"Ditmas Village\",\"Dongan Hills\",\"Douglaston\",\"Dyker Heights\",\"East Flatbush\",\"East Flushing\",\"East Gravesend\",\"East Harlem\",\"East New York\",\"East Tremont\",\"East Village\",\"Eastchester\",\"Edenwald\",\"Edgemere\",\"Egbertville\",\"Elm Park\",\"Elmhurst\",\"Elmhurst\",\"Eltingville\",\"Emerson Hill\",\"Erasmus\",\"Far Rockaway\",\"Farragut\",\"Fieldston\",\"Financial District\",\"Fish Bay\",\"Flatbush\",\"Flatlands\",\"Floral Park\",\"Flushing\",\"Flushing South\",\"Fordham\",\"Forest Hills\",\"Fort Greene\",\"Fort Hamilton\",\"Fort Wadsworth\",\"Fresh Meadows\",\"Fresh Pond\",\"Fulton Ferry\",\"Fulton Mall\",\"Garden Bay\",\"Georgetown\",\"Gerritsen Beach\",\"Glen Oaks\",\"Glendale\",\"Gowanus\",\"Gramercy Park\",\"Graniteville\",\"Grant City\",\"Grasmere\",\"Gravesend\",\"Gravesend\",\"Great Kills\",\"Greenpoint\",\"Greenridge\",\"Greenwich Village\",\"Greenwood Heights\",\"Grymes Hill\",\"Hamilton Heights\",\"Harding Park\",\"Harlem\",\"High Bridge\",\"Highland Park\",\"Hilltop Village\",\"Hollis\",\"Hollis Hills\",\"Holliswood\",\"Homecrest\",\"Howard Beach\",\"Huguenot\",\"Hunters Point\",\"Hunts Point\",\"Inwood\",\"Jackson Heights\",\"Jamaica\",\"Jamaica Estates\",\"Kensington\",\"Kensington\",\"Kew Gardens\",\"Kew Gardens Hills\",\"Kings Bay\",\"Kings Highway\",\"Kingsbridge\",\"Kingsbridge Heights\",\"Kips Bay\",\"Laconia\",\"Laurelton\",\"Lenox Hill\",\"Liberty Park\",\"Lincoln Square\",\"Linden Hill\",\"Lindenwood\",\"Little Italy\",\"Little Neck\",\"Livingston\",\"Locust Point\",\"Long Island City\",\"Long Island City\",\"Longwood\",\"Lower East Side\",\"Lower East Side\",\"Madison\",\"Malba\",\"Manhattan Beach\",\"Manhattan Valley\",\"Manhattanville\",\"Mapleton Borough Park\",\"Marble Hill\",\"Marine Park\",\"Mariners Harbor\",\"Maspeth\",\"Meadowmere\",\"Meiers Corners\",\"Melrose\",\"Middle Village\",\"Midland Beach\",\"Midtown\",\"Midwood\",\"Midwood\",\"Mill Basin\",\"Mill Island\",\"Morningside Heights\",\"Morris Heights\",\"Morris Park\",\"Morrisania\",\"Mott Haven\",\"Mount Hope\",\"Murray Hill\",\"Neponsit\",\"New Brighton\",\"New Dorp\",\"New Hyde Park\",\"New Lots\",\"New Springville\",\"NoHo\",\"North Corona\",\"Norwood\",\"Oakland Gardens\",\"Oakwood\",\"Ocean Breeze\",\"Ocean Hill\",\"Ocean Hill\",\"Ocean Parkway\",\"Ocean Parkway\",\"Old Astoria\",\"Old Town\",\"Olinville\",\"Ozone Park\",\"Park Slope\",\"Parkchester\",\"Pelham Bay\",\"Pelham Gardens\",\"Pelham Parkway\",\"Peter Cooper Village\",\"Pleasant Plains\",\"Plum Beach\",\"Polo Grounds\",\"Pomonok Houses\",\"Port Ivory\",\"Port Morris\",\"Port Richmond\",\"Prince’s Bay\",\"Prospect Heights\",\"Prospect Lefferts Gardens\",\"Queens Village\",\"Queensboro Hill\",\"Queensbridge\",\"Randall Manor\",\"Randall’s Island\",\"Ravenswood\",\"Red Hook\",\"Rego Park\",\"Remsen Village\",\"Richmond Hill\",\"Richmond Hill\",\"Richmond Valley\",\"Ridgewood\",\"Riverdale\",\"Rochdale Village\",\"Rockaway Park\",\"Roosevelt Avenue\",\"Roosevelt Island\",\"Rosebank\",\"Rosedale Arverne\",\"Rossville\",\"Rugby Canarsie\",\"Sea Gate\",\"Sheepshead Bay\",\"Shore Acres\",\"Silver Beach\",\"Silver Lake\",\"SoHo\",\"Soundview\",\"South Beach\",\"South Jamaica\",\"South Ozone Park\",\"Spanish Harlem\",\"Springfield Gardens\",\"Spuyten Duyvil\",\"St. Albans\",\"St. George\",\"Stapleton\",\"Starrett City\",\"Steinway\",\"Stuyvesant Heights\",\"Stuyvesant Town\",\"Sunnyside\",\"Sunnyside\",\"Sunset Park\",\"Sutton Place\",\"Throgs Neck\",\"Todt Hill\",\"Tompkinsville\",\"Tottenville\",\"Travis Annadale\",\"TriBeCa Chinatown\",\"Tudor City\",\"Tudor Village\",\"Turtle Bay\",\"Two Bridges\",\"Unionport\",\"University Heights\",\"University Heights\",\"Upper East Side\",\"Upper West Side\",\"Utopia\",\"Van Cortlandt Village\",\"Van Nest\",\"Vinegar Hill\",\"Wakefield\",\"Wards Island\",\"Washington Heights\",\"Waterside Plaza\",\"Weeksville\",\"West Brighton\",\"West Farms\",\"West Village\",\"Westchester Square\",\"Westerleigh Arrochar\",\"Whitestone\",\"Willets Point\",\"Williamsbridge\",\"Williamsburg\",\"Windsor Terrace\",\"Wingate\",\"Woodhaven\",\"Woodlawn\",\"Woodrow\",\"Woodside\",\"Woodside East\",\"Yorkville\"]")
  def url
    "/games/#{id}"
  end

  def self.all
    super.where("start > ? AND start < ?", Time.now, Time.now + 1.month)
  end

  def as_json(options={})
    super.merge(url: url, icon: icon)
  end

  def icon
    team.icon.present? ? team.icon.gsub('.png','_selected.png') : 'default_icon.png'
  end

  def start
    super ?  super.strftime('%m/%d/%Y') : super
  end

  def end
    super ?  super.strftime('%m/%d/%Y') : super
  end
end
