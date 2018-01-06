
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
http://assets.amuniversal.com/4147e5d0c6480135071f005056a9545d
```

```
!dilbert -date 2015-07-04
http://assets.amuniversal.com/f8cda390f0270132e9fb005056a9545d
```

```
!dilbert -date 2015-07-04 -alttext
http://assets.amuniversal.com/f8cda390f0270132e9fb005056a9545d
>One Missile - Dilbert by Scott Adams
```

```
!dilbert -date 2015-07-04 -alttext -transcript
http://assets.amuniversal.com/f8cda390f0270132e9fb005056a9545d
>One Missile - Dilbert by Scott Adams
>G-Man 1: One of our drones found the fugitive hacker Dilbert in a remote forest. He ate a poisonous berry and will be dead in minutes. Can I light him up for practice? G-Man 2: One missile. They're pricey.
```

[appveyor-badge]: https://ci.appveyor.com/api/projects/status/4r9969ao2s85a56h?svg=true
[appveyor-build]: https://ci.appveyor.com/project/devblackops/poshbot-dilbert
[psgallery-badge]: https://img.shields.io/powershellgallery/dt/poshbot.dilbert.svg
[psgallery]: https://www.powershellgallery.com/packages/poshbot.dilbert
