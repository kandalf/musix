Given /^the following albums exist$/ do |table|
  table.hashes.each do |attrs|
    Album.create(attrs)
  end
end

When /^I go to the albums path$/ do
  visit albums_path
end

Then /^I should see "([^"]*)"$/ do |content|
  page.should have_content content
end

Then /^I should not see "([^"]*)"$/ do |content|
  page.should_not have_content content
end

Given /^I am on the albums page$/ do
  When %{I go to the albums path}
end

When /^I click "([^"]*)"$/ do |action|
  click_link_or_button action
end

Then /^I should be on the new "([^"]*)" page$/ do |resource_name|
  current_path == "/#{resource_name.to_s}/new"
end

Given /^there's no albums$/ do
  Album.destroy_all
  Album.all.count.should == 0
end

When /^I go to the new "([^"]*)" page$/ do |resource_name|
  visit "/#{resource_name.pluralize}/new"
end

When /^I fill in "([^"]*)" with "([^"]*)"$/ do |selector, value|
  fill_in(selector, :with => value)
end

Then /^there should be (\d+) album$/ do |count|
  Album.count.should == count.to_i
end

Then /^I should be on the "([^"]*)" page$/ do |resource_name|
  current_path.should == "/#{resource_name}"
end
