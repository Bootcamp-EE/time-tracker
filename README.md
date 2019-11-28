# time-tracker
This is a time tracking application being built as a part of the bootcamp @ EqualExperts

## Links
* [Google Drive BC1](https://drive.google.com/drive/folders/16ZuWoxvy_2xEjm1Aq7DOas1wFkinE3db)

## Setup local jenkins
- To run setup for jenkins, you will need `JENKINS_PATH` to be set to a folder path. 
- Run command `docker-compose up` in `ci/` folder.


## Setup for mobile (flutter) development

- Download flutter and perform steps (till update path) for installing flutter. Refer [here](https://flutter.dev/docs/get-started/install/macos)
- Install android-sdk and dependent packages. 
    1. Installing android-sdk (Requires java 1.8)
        * `brew cask install android-sdk`
    2. Set `ANDROID_SDK_ROOT` path
    3. Create `repositories.cfg` file using  
        `touch ~/.android/repositories.cfg`
    4. Installing platform-tools and build-tools
        * `sdkmanager --update`
        * `sdkmanager "platform-tools" "platforms;android-29" "build-tools;29.0.3"`
        * `sdkmanager --list`
        * `sdkmanager "system-images;android-29;default;x86_64"`
- Pointing flutter to android-sdk
    * `flutter config --android-sdk <<path-to-your-android-sdk>>`
- Accepting Android SDK licenses
    * `flutter doctor --android-licenses`
- Connect devices in usb-debugging mode enabled and then execute `flutter run`
   
    
         
         
    
