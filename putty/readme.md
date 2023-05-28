# Sync PuTTY Across Windows Devices

This guide will help you synchronize PuTTY settings across multiple Windows devices.

## Steps

1. Generate a registry file by following these steps:
   - Open PuTTY on the source device.
   - Configure PuTTY settings according to your preferences.
   - Open the registry editor by pressing `Win + R` and typing `regedit`.
   - Navigate to `HKEY_CURRENT_USER\Software\Simontatham` in the registry editor.
   - Right-click on the `Simontatham` key and select "Export."
   - Save the exported file as `putty-registry.reg`.

2. Transfer the registry file to your target device(s). You can use methods like USB drive, network transfer, or cloud storage.

3. Merge the registry file with the target device(s) by following these steps:
   - Copy the `putty-registry.reg` file to the target device(s).
   - Open the `putty-registry.reg` file by double-clicking on it.
   - Windows will ask for confirmation to merge the registry entries. Click "Yes" to proceed.

4. The PuTTY settings from the source device will now be synced across all the devices where you merged the registry file.

Note: Modifying the registry can have unintended consequences on your system. It is recommended to back up your registry or create a system restore point before making any changes.

That's it! You have successfully synced PuTTY settings across your Windows devices.

Feel free to customize this README.md file further to add additional information or instructions if needed.
