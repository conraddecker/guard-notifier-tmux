require "guard/notifier"
require "guard-notifier-tmux/version"

module Guard
  module Notifier
    module Tmux
      extend self

      def available?(silent = false)
        !!system("tmux has-session")
      end  

      #type can be success, pending, failed, or notify
      def notify(type, title, message, image, options = {})
        color = case type
                when 'success' then :green
                when 'pending' then :yellow
                when 'failed'  then :red
                else                :black
                end

        send_message "#{title}: #{message}", color
      end

      DEFAULT_STATUSRIGHT = '"#22T" %H:%M %d-%b-%y'

      SCREEN_COLOR = {
        black:  %w{white black},
        green:  %w{black green},
        yellow: %w{black yellow},
        red:    %w{white red}
      }

      def send_message(msg = DEFAULT_STATUSRIGHT, sc = :black)
        #ensure present if passed nil
        msg ||= DEFAULT_STATUSRIGHT
        sc  ||= :black

        col = SCREEN_COLOR[sc]
        msg = "#[fg=#{col[0]},bg=#{col[1]}] #{msg}" unless msg == DEFAULT_STATUSRIGHT
        send_cmd(msg)
      end

      def send_cmd(msg)
        system "tmux set status-right '#{msg.gsub("'", "\'")}'"
      end
    end

    NOTIFIERS << [:tmux, Tmux]
  end
end
