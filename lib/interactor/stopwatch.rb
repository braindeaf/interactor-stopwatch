# frozen_string_literal: true

require "interactor"
require "active_support/deprecator"
require "active_support/deprecation"
require "active_support/core_ext/numeric/time"

require_relative "stopwatch/version"

module Interactor
  module Stopwatch
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def stopwatch(&block)
        around do |interactor|
          starts_at = Time.now
          interactor.call
          instance_exec((Time.now - starts_at).seconds, &block)
        end
      end
    end
  end
end
