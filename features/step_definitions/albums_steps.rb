Given /^the following albums exist$/ do |table|
  table.hashes.each do |attrs|
    artist_name = attrs.delete("artist")
    attrs[:artist_id] = Artist.find_or_create_by_name(artist_name).id
    Album.create(attrs)
  end
end

When /^I go to the albums page$/ do
  visit albums_path
end

Then /^I should see "([^"]*)"$/ do |content|
  page.should have_content content
end

Then /^I should not see "([^"]*)"$/ do |content|
  page.should_not have_content content
end

Given /^I am on the albums page$/ do
  When %{I go to the albums page}
end

When /^I click "([^"]*)"$/ do |action|
  click_link_or_button action
end

Then /^I should be on the new "([^"]*)" page$/ do |resource_name|
  current_path == "/#{resource_name.to_s}/new"
end

Given /^there's no (.+)$/ do |model_name|
  model = model_name.singularize.capitalize.constantize
  model.destroy_all
  model.all.count.should == 0
end

When /^I go to the new "([^"]*)" page$/ do |resource_name|
  visit "/#{resource_name.pluralize}/new"
end

When /^I fill in "([^"]*)" with "([^"]*)"$/ do |selector, value|
  fill_in(selector, :with => value)
end

Then /^there should be (\d+) album(s?)$/ do |count, _|
  Album.count.should == count.to_i
end

Then /^I should be on the "([^"]*)" page$/ do |resource_name|
  current_path.should == "/#{resource_name}"
end

When /^I select "([^"]*)" from "([^"]*)"$/ do |value, selector|
  select(value, :from => selector)
end

Then /^there should be (\d+) artist(s?)$/ do |count, _|
  Artist.count.should == count.to_i
end

Given /^the following artist exist$/ do |table|
  table.hashes.each do |attrs|
    Artist.create(attrs)
  end
end
