call "%VS100COMNTOOLS%vsvars32.bat"
msbuild /m:8 /V:q /property:WarningLevel=0;Configuration=%1;Platform=%2 %3
