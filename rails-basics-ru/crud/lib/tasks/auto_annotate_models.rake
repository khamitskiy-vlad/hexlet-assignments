# frozen_string_literal: true

# NOTE: only doing this in development as some production environments (Heroku)
# NOTE: are sensitive to local FS writes, and besides -- it's just not proper
# NOTE: to have a dev-mode tool do its thing in production.
if Rails.env.development?
  require 'annotate'
  task :set_annotation_options do
    # You can override any of these by setting an environment variable of the
    # same name.
    Annotate.set_defaults(
      'active_admin' => 'false',
      'additional_file_patterns' => [],
      'routes' => 'false',
      'models' => 'true',
      'position_in_routes' => 'before',
      'position_in_class' => 'before',
      'position_in_test' => 'before',
      'position_in_fixture' => 'before',
      'position_in_factory' => 'before',
      'position_in_serializer' => 'before',
      'show_foreign_keys' => 'true',
      'show_complete_foreign_keys' => 'false',
      'show_indexes' => 'true',
      'simple_indexes' => 'false',
      'model_dir' => 'app/models',
      'root_dir' => '',
      'frozen' => 'false',
      'classified_sort' => 'true',
      'trace' => 'false',
      'wrapper_open' => nil,
      'wrapper_close' => nil,
      'with_comment' => 'true'
    )
  end

  Annotate.load_tasks
end
