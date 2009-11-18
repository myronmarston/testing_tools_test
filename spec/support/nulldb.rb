if ENV['USE_REAL_DB']
  share_as :UseRealDB do
  end
else
  require 'nulldb_rspec'

  ActiveRecord::Base.establish_connection :adapter => :nulldb

  share_as :UseRealDB do
    before(:all) do
      ActiveRecord::Base.establish_connection(:test)
    end

    after(:all) do
      ActiveRecord::Base.establish_connection(:adapter => :nulldb)
    end
  end
end