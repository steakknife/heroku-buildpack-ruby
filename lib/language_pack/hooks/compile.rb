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
        try_run 'bin/before_compile', 'Running before compile hook bin/before_compile'
      end

      def after
        try_run 'bin/after_compile', 'Running after compile hook bin/after_compile'
      end
    end
  end
end
