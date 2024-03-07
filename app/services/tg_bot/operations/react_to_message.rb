module TgBot
  module Operations
    class ReactToMessage < BaseOperation
      def initialize(webhook)
        # будем оборачивать наше сообщение
        @message = Values::Message.new(webhook[:message])
      end

      def call
        # если сообщение не приватное, не будем на него отвечать
        return unless message.private?

        # если приватное, будет отправлять в ответ свое сообщение
        # будем реагировать на его текст
        case @message.text
        when "/start"
          SendMessage.call(chat_id, 'Hello!')
        else
          SendMessage.call(chat_id, 'Unknown Command')
        end
      end

      private

      attr_reader :message

      def chat_id
        message.chat.id
      end
    end
  end
end