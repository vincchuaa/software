require 'rack-cas/session_store/rails/active_record'
Rails.application.config.session_store ActionDispatch::Session::RackCasActiveRecordStore, key: (Rails.env.production? ? '_software_hut_team_10_session_id' : (Rails.env.demo? ? '_software_hut_team_10_demo_session_id' : '_software_hut_team_10_dev_session_id')),
                                                             secure: (Rails.env.demo? || Rails.env.production?),
                                                             httponly: true
