# --- USER SEED DATA --- #
User.destroy_all;

User.create(:name => 'Chris', :password => 'chicken', :email => 'chris@gmail.com');
User.create(:name => 'Armando', :password => 'chicken', :email => 'armando@gmail.com');
User.create(:name => 'Jin', :password => 'chicken', :email => 'jin@gmail.com');
User.create(:name => 'Sally', :password => 'chicken', :email => 'sally@gmail.com');
User.create(:name => 'John', :password => 'chicken', :email => 'john@gmail.com');

# --- OCCASIONS SEED DATA -- #
Occasion.destroy_all;

Occasion.create(:title => 'Vivid Lights', :date => '2016-01-01', :image => 'Vivid.jpg', :location => 'Sydney, NSW 2000', :description => 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', :website => 'http://www.vividsydney.com/', :email => 'vividsydney@gmail.com', :phone => '+61 2 9931 1490');

Occasion.create(:title => 'Mardigras', :date => '2016-03-04', :image => 'mardigras.jpg', :location => 'Oxford St Darlinghurst NSW Australia 2010', :description => 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', :website => 'http://www.mardigras.org.au/', :email => 'mardigras@gmail.com', :phone => '+61 (0)2 9383 0900');

Occasion.create(:title => 'Easter Show', :date => '2016-10-09', :image => 'Easter-show-logo.jpg', :location => 'Sydney, NSW 2000', :description => 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', :website => 'http://www.eastershow.com.au/', :email => 'eastershow@gmail.com', :phone => '+61 2 9934 1209');

Occasion.create(:title => 'Sydney Harbour Regatta', :date => '2016-01-01', :image => 'SHR.jpg', :location => 'Sydney, NSW 2000', :description => 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', :website => 'http://www.shr.mhyc.com.au/', :email => 'shr@gmail.com', :phone => '+61 2 3431 1340');

Occasion.create(:title => 'City 2 Surf', :date => '2016-05-12', :image => 'City2Surf.jpg', :location => 'Sydney, NSW 2000', :description => 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', :website => 'http://city2surf.com.au/', :email => 'city2surf@gmail.com', :phone => '+61 2 9944 5690');
