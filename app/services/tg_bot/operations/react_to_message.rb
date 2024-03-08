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
          SendMessage.call(chat_id, hello_text)
        when '/lips'
          SendVideo.call(chat_id, 'BAACAgIAAxkBAAIBB2Xhkbz_x1lLngJtZ4U6TrfsvxZeAALlQQAC_S4JS1xjvxnAXoI9NAQ')
        else
          SendMessage.call(chat_id, unknown_command_text)
        end
      end

      private

      attr_reader :message

      def chat_id
        message.chat.id
      end

      def hello_text
        <<~MESSAGE_TEXT
          Привет!
          Нажми /lips, чтобы получить подарок
        MESSAGE_TEXT
      end

      def unknown_command_text
        <<~MESSAGE_TEXT
          Нажми /lips, чтобы получить подарок
        MESSAGE_TEXT
      end
    end
  end
end