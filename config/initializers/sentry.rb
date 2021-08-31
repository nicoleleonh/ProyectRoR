Sentry.init do |config|
    config.dsn = 'https://3977439966ef464ca2ac1da2a2c75238@o982881.ingest.sentry.io/5938355'
    config.breadcrumbs_logger = [:active_support_logger, :http_logger]
  
    # Set tracesSampleRate to 1.0 to capture 100%
    # of transactions for performance monitoring.
    # We recommend adjusting this value in production
    config.traces_sample_rate = 0.5
    # or
    config.traces_sampler = lambda do |context|
      true
    end
  end