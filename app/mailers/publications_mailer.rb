class PublicationsMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.publications_mailer.publication_create.subject
  #
  def publication_create
    @greeting = "Hi"

    mail( to: "v25093735@gmail.com",
    subject: "prueba correo"    
    )
  end
end
