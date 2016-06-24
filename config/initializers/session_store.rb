# Be sure to restart your server when you modify this file.

Rails.application.config.session_store :cookie_store, key: '_cyclecity_session', domain: ".#{ENV['DOMAIN']}", secure: Rails.env.production?
