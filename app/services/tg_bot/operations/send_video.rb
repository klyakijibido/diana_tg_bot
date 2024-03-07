module TgBot
  module Operations
    class SendVideo < BaseOperation
      def initialize(chat_id, video)
        @chat_id = chat_id
        @video = video
      end

      def call
        result = HTTParty.post(send_video_url, headers: headers, body: message_params.to_json)

        result.success?
      end

      private

      attr_reader :chat_id, :video

      def send_video_url
        "#{API_URL}/sendVideo"
      end

      def headers
        {
          'Content-Type' => 'application/json'
        }
      end

      def message_params
        {
          chat_id: chat_id,
          video: video
          # reply_markup: ... для клавиатуры
        }
      end
    end
  end
end