@ECHO off
ECHO To use this automatic package generator you need the following tools in you system path:
ECHO *) the linux shell tools (rm, mv, etc. e.g. included in the WinAVR package) 
ECHO *) the InnoSetup tool (iscc.exe, download from http://www.jrsoftware.org/isinfo.php)
ECHO *) Git Versioning tool (git.exe download from http://git-scm.com/, when installing choose the option: "Run git from Windows Command Prompt")
ECHO *) Apache Ant build system (http://ant.apache.org/)
ECHO *) Wget download utility (e.g. cygwin + wget package)
ECHO.
ECHO This scripts expects the following files in the folder from where it gets called
ECHO *) Folder called: "java" containing a jre 7 32 bit
ECHO *) File called: "vcredist_x86.exe"  (Visual C++ Redistributable)
ECHO *) File called: "dotNetFx40_setup.exe"  (.Net Framework 4.0)
ECHO.
ECHO Press any key to start !
pause
git clone https://github.com/asterics/AsTeRICS
rm -r AsTeRICS/NativeASAPIlibraries
rm -r AsTeRICS/BNCIevaluationSuite
rm -r AsTeRICS/Android/AsTeRICSPhoneServer
cd AsTeRICS/ARE
call ant
cd ..
cd ..
rm -r AsTeRICS/ACS
rm -r AsTeRICS/ARE
mv AsTeRICS/bin/ACS AsTeRICS/ACS
mv AsTeRICS/bin/ARE AsTeRICS/ARE
mv AsTeRICS/bin/OSKA AsTeRICS/OSKA
rm -rf AsTeRICS/bin
rm -rf AsTeRICS/.git
rm -rf AsTeRICS/Documentation/ACS-Help
rm -rf AsTeRICS/bin
rm AsTeRICS/Documentation/ModelGuides/*.doc
rm AsTeRICS/Documentation/DIYGuides/*.doc
rm AsTeRICS/Documentation/*.doc
rm AsTeRICS/CIMs/Arduino/*.c
rm AsTeRICS/CIMs/Arduino/*.h
rm AsTeRICS/CIMs/Arduino/*.aps
cp AsTeRICS/CIMs/Arduino/driver/*.inf AsTeRICS/CIMs/Arduino
rm -r AsTeRICS/CIMs/Arduino/driver
rm AsTeRICS/CIMs/Arduino/build/Makefile
mv AsTeRICS/CIMs/Arduino/build/* AsTeRICS/CIMs/Arduino
rm -r AsTeRICS/CIMs/Arduino/build

rm -r AsTeRICS/CIMs/HID_actuator/Joystick_only
rm -r AsTeRICS/CIMs/HID_actuator/LUFA
mv AsTeRICS/CIMs/HID_actuator/Mouse_Keyboard_Joystick/*.hex AsTeRICS/CIMs/HID_actuator
rm -r AsTeRICS/CIMs/HID_actuator/Mouse_Keyboard_Joystick
rm -r AsTeRICS/CIMs/HID_actuator/Tools
rm -r AsTeRICS/CIMs/HID_actuator/USB_Specifications
cd AsTeRICS\CIMs\HID_actuator
wget http://www.pjrc.com/teensy/teensy.exe
cd ..
cd ..
cd ..

rm -r AsTeRICS/CIMs/Proximity_CIM
rm -r AsTeRICS/CIMs/Razor_IMU

cp AsTeRICS/CIMs/Sensorboard/driver/serial_install.exe AsTeRICS/CIMs/Sensorboard
cp AsTeRICS/CIMs/Sensorboard/firmware/sensorboard.hex AsTeRICS/CIMs/Sensorboard
rm -r AsTeRICS/CIMs/Sensorboard/3d-files
rm -r AsTeRICS/CIMs/Sensorboard/driver
rm -r AsTeRICS/CIMs/Sensorboard/firmware
rm -r AsTeRICS/CIMs/Sensorboard/GL850PCB
rm -r AsTeRICS/CIMs/Sensorboard/WiiCamPCB

cp -r AsTeRICS/Installer Installer
rm -r AsTeRICS/Installer
cp vcredist_x86.exe Installer/vcredist_x86.exe
cp -r  java Installer/java 
cp dotNetFx40_setup.exe Installer/dotNetFx40_setup.exe
cd Installer
call iscc setup.iss
cd ..
mv Installer/setup.exe .
rm -rf Installer
rm -rf AsTeRICS
pause