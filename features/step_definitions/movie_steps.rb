# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Movie.create(movie)
  end
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  step(%{I should see "#{e1}"})
  step(%{I should see "#{e2}"})
  assert page.body.index(e1) < page.body.index(e2)
end

Then /I should see "(.*)" after "(.*)"/ do |e1,e2|
  step(%{I should see "#{e1}"})
  step(%{I should see "#{e2}"})
  assert page.body.index(e1) >  page.body.index(e2)
end

When /I (un)?check the following ratings: (.*)/ do |uncheck,rating_list|
  rating_list.gsub(/(\s)/,'').split(',').each do |rating|
    if uncheck 
      step(%{I uncheck "ratings_#{rating}"})
    else
      step(%{I check "ratings_#{rating}"})
    end
  end#
end

Then /I should see all of the movies/ do:wq
  Movie.all.each do |m|
    step(%{I should see "#{m.title}"})
  end
end

Then /^the director of "([^"]*)" should be "([^"]*)"$/ do |movie,director|
  step(%{I am on the details page for "#{movie}"})
  assert page.body.index('Director') < page.body.index(director)
end
