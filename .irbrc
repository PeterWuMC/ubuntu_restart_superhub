# encoding: utf-8

require 'bundler'

Bundler.require

require 'capybara/dsl'
include Capybara::DSL

Capybara.default_driver = :selenium
