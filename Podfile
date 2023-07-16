# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
    end
  end
end

target 'EITC' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for EITC
  pod 'IQKeyboardManagerSwift'
  pod 'RxSwift'
  pod 'RxCocoa'
  pod 'ProgressHUD'
  pod 'Alamofire'
  pod 'AlamofireImage'

  target 'EITCTests' do
    inherit! :search_paths
    # Pods for testing
    pod 'OHHTTPStubs/Swift'
    pod 'RxBlocking'
    pod 'RxTest'
    pod 'SwiftyMocky'
  end

end
