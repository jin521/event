# --- USER SEED DATA --- #
User.destroy_all

u1 = User.create(:name => 'Chris', :password => 'chicken1', :email => 'chris@gmail.com');
u2 = User.create(:name => 'Armando', :password => 'chicken1', :email => 'armando2a2r@gmail.com');
u3 = User.create(:name => 'Jin', :password => 'chicken1', :email => 'jin@gmail.com');
u4 = User.create(:name => 'Sally', :password => 'chicken1', :email => 'sally@gmail.com');
u5 = User.create(:name => 'John', :password => 'chicken1', :email => 'john@gmail.com');

# --- OCCASIONS SEED DATA -- #
Occasion.destroy_all

o1 = Occasion.create(:title => 'Vivid Lights', :date => '2016-01-01', :image => 'Vivid.jpg', :location => 'Sydney, NSW 2000', :description => 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', :website => 'http://www.vividsydney.com/', :email => 'vividsydney@gmail.com', :phone => '+61 2 9931 1490');

o2 = Occasion.create(:title => 'Mardigras', :date => '2016-03-04', :image => 'mardigras.jpg', :location => 'Oxford St Darlinghurst NSW Australia 2010', :description => 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', :website => 'http://www.mardigras.org.au/', :email => 'mardigras@gmail.com', :phone => '+61 (0)2 9383 0900');

o3 = Occasion.create(:title => 'Easter Show', :date => '2016-10-09', :image => 'Easter-show-logo.jpg', :location => 'Sydney, NSW 2000', :description => 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', :website => 'http://www.eastershow.com.au/', :email => 'eastershow@gmail.com', :phone => '+61 2 9934 1209');

o4 = Occasion.create(:title => 'Sydney Harbour Regatta', :date => '2016-01-01', :image => 'SHR.jpg', :location => 'Sydney, NSW 2000', :description => 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', :website => 'http://www.shr.mhyc.com.au/', :email => 'shr@gmail.com', :phone => '+61 2 3431 1340');

o5 = Occasion.create(:title => 'City 2 Surf', :date => '2016-05-12', :image => 'City2Surf.jpg', :location => 'Sydney, NSW 2000', :description => 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', :website => 'http://city2surf.com.au/', :email => 'city2surf@gmail.com', :phone => '+61 2 9944 5690');

# Adding ocassions to users
u1.occasions << o1
u2.occasions << o2
u3.occasions << o3
u4.occasions << o4
u5.occasions << o5
