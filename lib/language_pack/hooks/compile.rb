require 'language_pack/shell_helpers'

module LanguagePack
  module Hooks
    module Compile
      include LanguagePack::ShellHelpers
      extend self

      def hooks
        before
        yield
        after
      end

    private
      def before
        if ENV.include? 'BUILDPACK_PRE_COMPILE'
          topic 'Running pre-compile command'
          run ENV['BUILDPACK_PRE_COMPILE']
        end
      end

      def after
        if ENV.include? 'BUILDPACK_POST_COMPILE'
          topic 'Running post-compile command'
          run ENV['BUILDPACK_POST_COMPILE']
        end
      end
    end
  end
end
