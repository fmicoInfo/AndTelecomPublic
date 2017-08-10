platform :ios, '8.0'
use_frameworks!

target 'AndorraTelecomPublic' do
    pod 'LiferayScreens', :git => 'https://github.com/liferay/liferay-screens', :branch => 'feature/LSR-1004'
end

post_install do |installer|
	installer.pods_project.targets.each do |target|
		target.build_configurations.each do |config|
			config.build_settings['CONFIGURATION_BUILD_DIR'] = '$PODS_CONFIGURATION_BUILD_DIR'
		end
	end
end