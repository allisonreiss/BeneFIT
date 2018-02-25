# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'AthenaHacks' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for AthenaHacks
#  pod 'HyperTrack'
  pod 'AFNetworking', '~> 3.0'
  pod 'Firebase/Core'
  pod 'Firebase/Database'
  pod 'FirebaseUI'

    post_install do |installer|
        installer.pods_project.targets.each do |target|
            target.build_configurations.each do |config|
                config.build_settings['SWIFT_VERSION'] = '3.2'
            end
        end

        Dir.glob('Pods/SQLite.swift/Sources/SQLite/**/*.swift').each { |path|
            begin
                text = File.read(path)
                text = text.gsub(/import CSQLite/, 'import SQLite3')
                File.open(path, 'w') { |file| file.puts text }
                rescue Exception
                puts "Unable to patch #{path}: #{$!}"
            end
        }
    end

  target 'AthenaHacksTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'AthenaHacksUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end
