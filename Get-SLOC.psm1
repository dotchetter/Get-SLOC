

function Get-SLOC
{
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
 https://github.com/dotchetter/Get-SLOC
#>

    $rows = 0
    $IgnoredExtensions = @(
        '.txt', '.dat',
        '.rtf', '.md',
        '.env', '.log',
        '.err', '.exe',
        '.zip', '.tar',
        'tar.gz', '.7z',
        '.dll', '.bin',
        '.pdf', '.ppt',
        '.pptx', '.xls',
        '.xlsx', '.git',
        '.sln', '.vcxproj',
        '.vcxproj.user', 'vcxproj.filters'
    )

    foreach ($file in Get-ChildItem * -Force -ErrorAction SilentlyContinue)
    {
        if ($file.Extension -notin $IgnoredExtensions -and $file.Name -ne 'LICENSE' -and $file.GetType() -ne 'System.IO.DirectoryInfo')
        {
            foreach ($row in Get-Content $file -ErrorAction SilentlyContinue){
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