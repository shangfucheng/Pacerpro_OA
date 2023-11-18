# PacerPro OA: Fucheng Shang

The soft delete model is implemented in Ruby on Rails.

* Created Model Item in app->models->item.rb

* Created Controller in app->controllers->items_controller.rb

* Created Views in app->views->items->index.html.erb  : root view page

* Created Views in app->views->items->new.html.erb    : add new item page

* Created Rspec test in spec->models->item_spec.rb


NOTE: You may need to update ruby version in 'Gemfile' and '.ruby-version' to work on your local machine.

Command to Start rails server: rails server

Command to Start rails server if above command does not work: bin/rails server

Once server start, a url generated in the console can be used to test on the webpage:

* Can create new item

* Can delete item

* Can restore item

Rspec Test Command: bundle exec rspec --format documentation spec/models/item_spec.rb

Thank you for taking time to review the test. 
