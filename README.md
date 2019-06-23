# macOS_Bundles
Methodology for bundling command-line applications into native applications

Bundling command-line programs into macOS applications can be a difficult process, but it allows you to deploy a ready-to-work application, without the users having to install any dependencies or perform any configurations. 

Usually, compiled programs require dynamic libraries which are located at specific paths somewhere inside your computer. These libraries can be discovered using **otool**, a built-in command on macOS.
 
 A macOS application is a folder which can be accessed by right-clicking, then hitting Show Package Contents on any application already installed on your computer. Applications have a somewhat regular structure, with a main folder called Contents, inside which there are multiple files and folders.
 
 For creating your own macOS application bundle, you must create a similar file hierarchy. An example is provided in the folder templates on this repository.
 
 After checking that your program works as expected, you must trace all necessary dynamic libraries and copy them to a local folder, but also change the path where the operating system looks for them.
 
 The script *copy_dependencies.sh* is a script you can run in the root folder of your application. It searches for all executable files recursively and resolves all the dependency issues mentioned above using [macdylibbundler](https://github.com/auriamg/macdylibbundler).
 The script copies all required libraries into a folder named Libraries which you can place inside your bundle.
 Folder MacOS is mandatory to exist and contains the main entrypoint of your application, as specified in Info.plist. Using the scripts provided, a new Terminal window will be opened and it will run the script configure.sh. I tried to avoid having two scripts, but I could not find a way around this. Using configure.sh, you can do various setups, like adding new paths to PATH, displaying a help menu when starting the application, etc. It is up to you to decide!
 
 Once you get our application bundled and working, you can wrap it in a standard DMG, like other applications downloaded from the internet, by placing your ".app" file inside a new folder, creating a symlink to /Applications/ next to it and then wrapping the parent folder inside a DMG image using Disk Utility (GUI) or hdiutil (CLI).
 
 
