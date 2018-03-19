  # Uncomment the next line to define a global platform for your project
   platform :ios, '9.0'
   inhibit_all_warnings!

target 'SendMoney' do
  use_frameworks!
  pod 'Alamofire', '~> 4.7'
  pod 'SwiftyJSON'
  pod 'AlamofireObjectMapper', '~> 5.0'
  pod 'UIColor_Hex_Swift', '~> 4.0.1'
  pod 'RealmSwift', '~> 2.10.1'

  target 'SendMoneyTests' do
    inherit! :search_paths

    pod 'Quick', git: 'https://github.com/Quick/Quick.git', branch: 'master'
    pod 'Nimble'
  end
end
