Pod::Spec.new do |s|
  s.name         = "ChatDTO"
  s.version      = "1.0.2"
  s.summary      = "ChatDTO"
  s.description  = "ChatDTO consists of requests and responses data object transfers for coding and encoding purposes only."
  s.homepage     = "https://pubgi.fanapsoft.ir/chat/ios/chat-dto"
  s.license      = "MIT"
  s.author       = { "Hamed Hosseini" => "hamed8080@gmail.com" }
  s.platform     = :ios, "10.0"
  s.swift_versions = "4.0"
  s.source       = { :git => "https://pubgi.fanapsoft.ir/chat/ios/chat-dto", :tag => s.version }
  s.source_files = "Sources/ChatDTO/**/*.{h,swift,xcdatamodeld,m,momd}"
  s.frameworks  = "Foundation"
  s.dependency "ChatModels" , '1.0.2'
end
