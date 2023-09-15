# Sync PuTTY Across Windows Devices

This guide will help you synchronize PuTTY settings across multiple Windows devices.

## Steps

1. Generate a registry file by following these steps:
   - Open powershell as admin
   - reg export HKCU\Software\SimonTatham ([Environment]::GetFolderPath("Desktop") + "\putty.reg")
   - saves to C:\Users\%user%\OneDrive\Desktop
2. Transfer the registry file to your target device(s).

3. Merge the registry file with the target device(s) by following these steps:
   - Copy the `putty-registry.reg` file to the target device(s).
   - Open the `putty-registry.reg` file by double-clicking on it.
   - Windows will ask for confirmation to merge the registry entries. Click "Yes" to proceed.
   or
   - open powershell as admin
   - reg import putty.reg
4. The PuTTY settings from the source device will now be synced across all the devices where you merged the registry file.

Note: Modifying the registry can have unintended consequences on your system. It is recommended to back up your registry or create a system restore point before making any changes.
