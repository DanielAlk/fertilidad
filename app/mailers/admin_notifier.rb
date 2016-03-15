class AdminNotifier < ApplicationMailer
  default to: ENV['NOTIFICATIONS_MAILER_TO']

  def contacts(contact)
    @contact = contact

    mail subject: "Nuevo Contacto en laboratorioyfertilidad.com"
  end

end
