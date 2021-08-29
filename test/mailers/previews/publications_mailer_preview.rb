# Preview all emails at http://localhost:3000/rails/mailers/publications_mailer
class PublicationsMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/publications_mailer/publication_create
  def publication_create
    PublicationsMailer.publication_create
  end

end
