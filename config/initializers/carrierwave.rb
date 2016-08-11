::CarrierWave.configure do |config|
  config.storage             = :qiniu
  config.qiniu_access_key    = "R9u_2mgaRE7DlsR0qP1LF-ucUjdGbFJspHPuPQxx"
  config.qiniu_secret_key    = 'Ju5h_X6xhBKMBRW8A7D7vbGE2dllU6zh7TAAM1eK'
  config.qiniu_bucket        = "pic-artcraft"
  config.qiniu_bucket_domain = "obq6b1u0d.bkt.clouddn.com"
  config.qiniu_block_size    = 4*1024*1024
  config.qiniu_protocal      = "http"
end