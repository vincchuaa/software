# Team Allocation System
A system that facilitates the splitting of students into teams for group projects keeping in mind their preferences (of who they do and do not want on their teams) while maintaining a pre decided ratio in gender and domicile across teams. The system allows lecturers to customise their requirements for teams and along with input from students automatically generates the required teams. After the teams are generated, lecturers can then customise the teams as to their liking.

### Getting Started
Clone the project, then:
* `cp config/database_sample.yml config/database.yml` and change credentials as appropriate.
* `bundle install`
* `yarn install`
* `rails db:setup`
* `rails s`
* `bin/webpack-dev-server` for live reloading.

### Testing
* Run specs with `rspec`
* Run Jest tests with `yarn test`
* Run static analysis with `brakeman`
* **Run all of the above with `rake`**

### CI
TODO: Fail if RSpec / Jest tests fail or if Brakeman finds a "medium" issue.

### Style Guide
A style guide is maintained for reference at `/style_guide`.

### Deployment
*QA -> Demo -> Production* using the `epi-deploy` gem.
