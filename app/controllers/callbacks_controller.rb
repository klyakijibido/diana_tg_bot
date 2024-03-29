class CallbacksController < ApplicationController
  def index
    head :ok
    return
  end

  def telegram
    unless telegram_header == ENV.fetch("TELEGRAM_BOT_SECRET")
      head :forbidden
      return
    end

    # если прислали ерунду, на нее не реагируем
    unless params.dig(:callback, :message).present?
      head :ok
      return
    end

    TgBot::Operations::ReactToMessage.call(params[:callback])

    head :ok
  end

  def telegram_header
    request.headers['HTTP_X_TELEGRAM_BOT_API_SECRET_TOKEN']
  end
end
