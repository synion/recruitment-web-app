# recruitment-web-app
This is a spec for a candidate evaluation app.


## App requirements
1. After navigating to the root directory using a web browser, the app should display a login page. If the user is logged in, then user listing is being displayed. 
  Hint: it is usually a good idea to use a gem / working component to solve "standard" problems for a web app. In this context: https://github.com/plataformatec/devise

2. Userbase consists of two types of users: regular and admin.
  Hint: Do not overcomplicate this. Also stuff that may come handy later: https://github.com/ryanb/cancan

3. Admins can see a trash can icon next to each user on the listing. They can click it and delete an user. Admins should not be able to delete themselves. The listing includes the following information: email, gender, age, points of interests. Requirement: Points of interests is a separate table. User can have many points of interest.

4. Admin can see a link "navigate to the admin panel" somewhere on the page. He can click the link to display that page (accessible only by admins).

5. In the admin panel there is a form, where an email, gender, age, points of interests can be specified for new and existing users. Requirement: the form should offer a possibility to dynamically specify the points of interest for the user, by adding additional fields to the form, without reloading the page. Each point of interest can have a name and a type (from the predefined collection of: ["health", "hobby", "work"]). When it comes to the number of points of interest, user can have them between 0 and infinity. 
  Hint: https://github.com/ryanb/nested_form lub https://github.com/nathanvda/cocoon

6. The admin panel should display a number which shows the amount of points of interests in the system of "health" type, chosen by women aged between 20 and 30, and the names of PoIs should start with "cosm". The query should be written using SQL or appriopriate DSL offered for instance by ActiveRecord. Usng Ruby for data manipualtion here is a faux pas. In other words, show me your SQL magic.

7. On the regular users listing, admin can see a button "Export to CSV". After clicking a link, user gets a csv file with exported users. Hint https://www.ruby-toolbox.com/categories/reporting

8. On the user listing, everybody can see a mailbox icon. Everyone can click it. A click triggers an action where the email is being sent to the target user with content "<current user email> sends his regards". The recipient is of course the target user.   Requirement: use Service Object pattern to implement the email sending functionality. Hint: https://rubygems.org/gems/mailcatcher/versions/0.6.1

9. On the user listing there should be a search_field so users should be able to scope the listing by inputing the email. Bonus points for considering SQL injections while developing the feature. Hint: https://github.com/activerecord-hackery/ransack


## How to get started
1. Fork the repo.
2. Add your evaluator as a contributor to your fork, so he or she can review pull requests.
3. Implement each requirement in a separate commit. The app should work according to the spec describe in each stage. So if somebody does `git reset --hard <stage>`, he will encounter no problems with the give app version.
4. Each stage of the app development should be presented as a pull request.
5. We love when a project has a test suite. Here is a hint: http://www.relishapp.com/rspec/rspec-rails/docs/gettingstarted

# Good luck!
