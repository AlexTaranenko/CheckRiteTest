# Uncomment the next line to define a global platform for your project
platform :ios, '15.0'

install! 'cocoapods', :warn_for_unused_master_specs_repo => false

# ignore all warnings from all pods
inhibit_all_warnings!

target 'CheckRiteTest' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

pod 'SVProgressHUD'
pod 'SDWebImage', '~> 5.0'

post_install do |pi|
  pi.pods_project.targets.each do |t|
    t.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '15.0'
      config.build_settings['CODE_SIGNING_ALLOWED'] = 'NO'
    end
  end
end

end
