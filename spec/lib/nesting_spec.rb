# require 'spec_helper'
# 
# describe "context 1" do
#   before(:all) do
#     puts "before all 1"
#   end
# 
#   before(:each) do
#     puts "before each 1"
#   end
# 
#   after(:all) do
#     puts "after all 1"
#   end
# 
#   after(:each) do
#     puts "after each 1"
#   end
# 
#   it "should have an example at level 1" do
#     puts "  example 1a"
#   end
# 
#   it "should have another example at level 1" do
#     puts "  example 1b"
#   end
# 
#   describe "  context 2" do
#     before(:all) do
#       puts "  before all 2"
#     end
# 
#     before(:each) do
#       puts "  before each 2"
#     end
# 
#     after(:all) do
#       puts "  after all 2"
#     end
# 
#     after(:each) do
#       puts "  after each 2"
#     end
# 
#     it "should have an example at level 2" do
#       puts "    example 2a"
#     end
# 
#     it "should have another example at level 2" do
#       puts "    example 2b"
#     end
# 
#     describe "    context 3" do
#       before(:all) do
#         puts "    before all 3"
#       end
# 
#       before(:each) do
#         puts "    before each 3"
#       end
# 
#       after(:all) do
#         puts "    after all 3"
#       end
# 
#       after(:each) do
#         puts "    after each 3"
#       end
# 
#       it "should have an example at level 3" do
#         puts "      example 3a"
#       end
# 
#       it "should have another example at level 3" do
#         puts "      example 3b"
#       end
#     end
#   end
# end