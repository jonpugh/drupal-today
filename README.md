# Drupal Today

A simple Drupal 9 project that was created in one day to demonstrate how  
test-driven development and best practices can be done quickly and efficiently.

It is/will be built from the [`drupal-composer/drupal-project`](https://github.com/drupal-composer/drupal-project) template.

## Requirements

1. As an anonymous user, I can register and sign in to the website.
2. As an anonymous user, I can see a list of the last 5 users who signed in.
2. As an authenticated user, I can see a list of the last 5 users who signed in, including myself.

## Build Plan

Each Epic will be a pull request, and each pull request will be merged once commit status passes.

1. Epic: Create codebase and enable basic CI. 
   - Acceptance Criteria: Drupal site installs.
   - Tasks:
     1. Implement CI in GitHub actions using existing config from drupal-composer/drupal-project.
     2. Ensure `composer install`, `drush site-install`, `drush user-login`, and `drush status` all pass.

2. Epic: Implement Behavioural Testing command.
   - Acceptance Criteria: Simple `behat` tests pass.
   - Tasks: 
     1. Ensure the drupal behat extension is installed and bin/behat runs successfully.
     2. Write a single simple Drupal test with steps to confirm the home page and user creation works.

3. Epic:  Implement Requirements Tests.
   - Acceptance Criteria: Behavioral tests are defined and indicate failure where new functionality is needed.
   - Tasks:
     1. Write a single Behat feature to define the requirements, including a user story describing the purpose and intent of the feature.
     2. Review the feature steps to confirm with Site Owner the desired functionality.
     3. Ensure the `behat` steps run until the new functionality is expected.
     4. Change the CI script to allow the new test to fail, so that commit status is passing.

4. Epic: Develop the required Features.

    In the "real world", the feature might be best implemented with PHP code or with other modules. 
    It would be up to the development team to determine *how* to implement the features, taking into account
    short and long term factors like total maintenance over time.
    
    As a programming exercise, one could ask a developer to replace this functionality with PHP code, 
    using the same functional tests to confirm the desired behavior was implemented.

    However, the purpose of this project is speed, so the development of this feature will be done with Drupal Site Building tools.

    - Acceptance Criteria: Behavioral tests confirm the desired functionality is present and working.
    - Tasks:
      1. Create a View with a Block display of Users with the correct filters to match the requirements.
      2. Place the Block in a region and ensure anonymous and authenticated users can see it.
      3. Allow anonymous users to register and sign in and view their own profiles and nothing else.
      4. Export the site's config to the git repository.
      5. Ensure the CI system installs the site from the exported code.
      6. Ensure the Tests have enough steps to confirm full functionality:
        1. Test user registration and sign in.
        2. Test block content for anonymous and authenticated users.
        3. Test a new user logging in.
        4. Test the block content for that new user for anonymous and authenticated users.
