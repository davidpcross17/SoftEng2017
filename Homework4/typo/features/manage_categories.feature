Feature: Manage Categories
  As a blog administrator
  In order to group the blog entries by themes
  I want to be able to add and edit categories in my blog
  
  Background:
    Given the blog is set up
    And I am logged into the admin panel
    
Scenario: Succesfully create a new category
  Given I am on the new category page
  When I fill in "category_name" with "Foobar"
  And I press "Save"
  Then I should see "Foobar"
  
Scenario: Succesfully edit an exisiting category
  Given I am on the new category page
  When I fill in "category_description" with "New Description"
  And I fill in "category_name" with "New Cat"
  And I press "Save"
  Then I should see "New Description"
  