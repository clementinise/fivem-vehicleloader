# fivem-vehicleloader [![Release](https://img.shields.io/badge/Release-V%201.0-blue)](https://github.com/clementinise/fivem-vehicleloader/releases/latest)

## WHAT IS FIVEM-VEHICLELOADER?
**FiveM Vehicle Loader is a resource that prevent your players to see invisible vehicles in game, the resource load all the addon vehicles while the player is joining the server.**

![image](https://i.imgur.com/QQXwiPa.png)

### This resource use [FiveM-checker](https://github.com/clementinise/fivem-checker), created to easily keep track if a resource need to be updated!

**KNOWN BUG :** 
* None (For now I guess?)

---

## WHAT IS CONFIGURABLE?

### Config.DebugPrint
`default: true`

**This will print info on what the resource is currently doing in client console. The image at the top of this README.md is an example of what will be diplayed if set to true**

### Config.VehicleFolderName
`default: [vehicle]`

**If you're putting all your addon vehicles in a folder, you can set the name of said folder in "Config.VehicleFolderName", tho if you're not, you can simply set it to `""` to avoid any issue. The resource will then check this folder for all model that have the same name has all subfolders**

*If you have a pack of addon vehicles, fivem-vehicleloader will not find them all, since it's not possible to "scan" content of folders. The solution is to then include all the missing addon vehicles in "Config.OtherVehicles", but more info on that below*

### Config.OtherVehicles
`default: {"test1","test2"}`

**If fivem-vehicleloader isn't loading particular vehicles, you can put them in this list. It is a easy way to deal with pack of addon vehicle that the resource can't detect (as explained above).**

---

## INSTALLATION
Download the [latest release](https://github.com/clementinise/fivem-vehicleloader/releases/latest).

Drag the folder into your `<server-data>/resources` folder
Add this in your `server.cfg`:
```
ensure fivem-vehicleloader
```
