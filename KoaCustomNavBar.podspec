Pod::Spec.new do |s|
  s.name     = 'KoaCustomNavBar'
  s.version  = '1.0.0'
  s.platform = :ios, '5.0'
  s.license  = 'MIT'
  s.summary  = 'Minimal & easily customizable Navigation Bar.'
  s.homepage = 'https://github.com/sergigracia/KoaCustomNavBar'
  
  s.author   = { 'Sergi Gracia' => 'sergigram@gmail.com', 'Polina Flegontovna' => 'polina.flegontovna@gmail.com' }
  s.source   = { :git => 'https://github.com/sergigracia/KoaCustomNavBar.git', :tag => s.version.to_s }

  s.description = 'Add this custom, flat, minimal, modern Navigation Bar ' \
                  'to your app. You can change the font, colors, size ' \
                  'and even add buttons using FontAwesome icons. ' \
                  'This library is very easy to add and customize. ' \
                  'Enjoy.'

  s.frameworks   = 'QuartzCore'
  
  s.source_files = 'KoaCustomNavBar/*.{h,m}'
  s.public_header_files = 'KoaCustomNavBar/*.h'
  
  s.ios.resources = "KoaCustomNavBar/Resources/**/*.ttf"
  s.osx.resources = "KoaCustomNavBar/Resources/Fonts"

  s.preserve_paths  = 'Demo'
  s.requires_arc = true
end