
function Get-Dilbert {
    <#
    .SYNOPSIS
        Retrieve a Dilbert comic.
    .DESCRIPTION
        Retrieve a Dilbert comic.
    .PARAMETER Date
        The date of the Dilbert comic to retrieve.
    .PARAMETER AltText
        Include the alternate text of the comic.
    .PARAMETER Transcript
        Include the transcript of the comic.
    .EXAMPLE
        !dilbert

        Get the newest comic
    .EXAMPLE
        !dilbert -date 2015-07-04

        Get the Dilbert comic published on 2015-07-04
    .EXAMPLE
        !dilbert -date 2014-12-25 -transcript

        Get the Dilbert comic and include the transcript
    .EXAMPLE
        !dilbert -alttext

        Get the Dislbert comic including the alternate text for the image.
    #>
    [PoshBot.BotCommand(CommandName = 'dilbert')]
    [cmdletbinding()]
    param(
        [datetime]$Date = (Get-Date),

        [switch]$AltText,

        [switch]$Transcript
    )

    $ProgressPreference = 'SilentlyContinue'
    Add-Type -AssemblyName System.Web

    if ($Date -ge [datetime]'1989-04-16') {

        if ($Date -gt (Get-Date)) {
            Write-Error 'What are you, from the future?'
            return
        }

        $isoDate = $Date.ToString('yyyy-MM-dd')
        $uri = "https://dilbert.com/strip/$isoDate"
        try {
            $html = Invoke-WebRequest -Uri $uri -UseBasicParsing
            $img = @($html.Images | Where-Object {$_.class -like '*img-comic*'})[0]
            $imageUri = 'https:{0}' -f $img.src
            if ($global:PoshbotContext.BackendType -in @('TeamsBackend')) {
                'https:{0}' -f $img.src
                "![img]($imageUri)"
            } else {
                $imageUri
            }
            if ($AltText) {
                $altDecoded = [System.Web.HttpUtility]::HtmlDecode($img.alt.Trim())
                '>' + $altDecoded
            }

            # Parse comic transcript
            # I feel a little dirty parsing the HTML this way but <shrug>
            if ($Transcript) {
                $div = (($html.Content -Split '<div id="js-toggle-transcript-' + $isoDate + '" class="js-toggle-container">')[1] -Split '</div>')[0]
                $p = (($div -split '<p>')[1] -split '</p>')[0]
                '>' + [System.Web.HttpUtility]::HtmlDecode($p)
            }
        } catch {
            Write-Error "Unable to retrieve comic at [$uri]"
        }
    } else {
        throw 'The first Dilbert comic was posted on April 16, 1989. The parameter -Date must be greater than or equal to that.'
    }
}

Export-ModuleMember -Function 'Get-Dilbert'
