Pod::Spec.new do |s|
  s.name         = "KIInPlaceEdit"
  s.version      = "0.1.0"
  s.summary      = "In-place editing for iOS."
  s.description  = "This UILabel category enables users to edit a label text in a place."
  s.homepage     = "https://github.com/kaiinui/KIInPlaceEdit"
  s.license      = "MIT"
  s.author       = { "kaiinui" => "lied.der.optik@gmail.com" }
  s.source       = { :git => "https://github.com/kaiinui/KIInPlaceEdit.git", :tag => "v0.1.0" }
  s.source_files  = "InPlaceEdit/Classes/**/*.{h,m}"
  s.requires_arc = true
  s.platform = "ios", '7.0'
end