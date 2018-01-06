
[![Build status][appveyor-badge]][appveyor-build]
[![PowerShell Gallery][psgallery-badge]][psgallery]

# PoshBot.Dilbert

A simple [PoshBot](https://github.com/devblackops/PoshBot) plugin to retrieve Dilbert comic images.

## Install Module

To install the module from the [PowerShell Gallery](https://www.powershellgallery.com/):

```
PS C:\> Install-Module -Name PoshBot.Dilbert -Repository PSGallery
```

## Install Plugin

To install the plugin from within PoshBot:

```
!install-plugin -name poshbot.dilbert
```

## Usage
```
!dilbert
CHANGEME
```

```
!dilbert -date 2015-07-04
CHANGEME
```

[appveyor-badge]: https://ci.appveyor.com/api/projects/status/eui6lam92efc5n8k?svg=true
[appveyor-build]: https://ci.appveyor.com/project/devblackops/poshbot-dilbert
[psgallery-badge]: https://img.shields.io/powershellgallery/dt/poshbot.dilbert.svg
[psgallery]: https://www.powershellgallery.com/packages/poshbot.dilbert
