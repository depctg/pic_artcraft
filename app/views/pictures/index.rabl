# app/views/pictures/index.rabl

node(:nav) {  paginate(@pictures) }
child :@pictures => :picture do
  attributes :filename
  node :raw do |pic| raw_url pic end
  node :thumbnail do |pic| limit_width_url pic end
  node :download do |pic| download_url pic end
end
