<#
.Synopsis
 Get the number of lines of code (comments included) in a given folder.

.Description
 Use this commandlet in a directory with source code files to quickly
 sum up the lines of code in your directory. The iteration is not recursive
 due to potential errors and parsing unwanted Git files, so nested structures
 have to be counted separately.

.Example
 Get-SLOC

.Link 
 https://github.com/dotchetter/SLOC-Counter
#>


function Get-SLOC
{
    $rows = 0
    $IgnoredExtensions = @(
        '.txt',
        '.dat',
        '.rtf',
        '.md',
        '.env',
        '.log',
        '.err',
        '.exe',
        '.zip',
        '.tar*',
        '.7z',
        '.dll',
        '.bin',
        '.pdf',
        '.ppt*',
        '.xls*',
        '.git'
    )

    foreach ($file in Get-ChildItem * -Force -ErrorAction SilentlyContinue)
    {
        if ($file.Extension -notin $IgnoredExtensions -and $file.Name -ne 'LICENSE')
        {
            foreach ($row in Get-Content $file){
                if ($row.length -gt 0)
                {
                    $rows++
                }
            }
        }
    }

    if ($rows -gt 0)
    {
        $rows
    }
    else
    {
        0
    }
}