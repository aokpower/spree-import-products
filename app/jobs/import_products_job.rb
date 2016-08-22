class ImportProductsJob < ActiveJob::Base
  queue_as :default

  after_perform :notify_admin

  rescue_from(StandardError) do |exception|
    Rails.logger.error("[ActiveJob] [#{self.class}] [#{job_id}] ID: #{@product_id} #{exception}")
    products = Spree::ProductImport.find(@product_id)
    store = Spree::Store.find(@store_id)
    user = Spree::User.find(products.created_by)
    Spree::UserMailer.product_import_results(user, store, exception.message + " " + exception.backtrace.join("\n")).deliver
    #Hacemos aquí el update para que aunque falle, enviemos el mail igualmente
    products.error_message = exception.message + ' ' + e.backtrace.inspect
    products.failure
  end

  def perform(product_id, current_store_id)
    @product_id = product_id
    @store_id = current_store_id
    products = Spree::ProductImport.find(product_id)
    products.import_data!(true)
  end

  def notify_admin
    products = Spree::ProductImport.find(@product_id)
    store = Spree::Store.find(@store_id)
    user = Spree::User.find(products.created_by)
    #log("USER: #{user.email}")
    Spree::UserMailer.product_import_results(user, store).deliver
  end

  private
  def log(message, severity = :info)
    @rake_log ||= ActiveSupport::Logger.new('log/import_products.log')
    message = "[#{Time.now.to_s(:db)}] [#{severity.to_s.capitalize}] #{message}\n"
    @rake_log.send severity, message
    puts message
  end
end
