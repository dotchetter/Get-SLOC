# SLOC-Counter

#### Cmdlet designed to quickly and easily get the count of source lines of code in a given directory.

## About

The SLOC-Counter module is incredibly short and sweet; run it, and get the lines of code in the current directory.
Files with text or binary extensions are ignored. Empty rows are ignored.

Comments and block comments are included in the counting.

The iteration is non-recursive in the directory hierarchy - meaning, that no subfiles will be parsed.

## Installation

1. Set the execution policy to Bypass using an **Administrator** PowerShell window:

   ```powershell
   Set-Executionpolicy Bypass
   ```

2. Download this repository by clicking on the green **Clone or download** button on this page, and choose "Download ZIP"

3. Open PowerShell and navigate to the **location** of the downloaded **findf-master** folder.

4. Copy and paste this command in your PowerShell terminal:

   ```powershell
   Expand-Archive .\Get-SLOC-master.zip -DestinationPath "C:\Program Files\WindowsPowerShell\Modules"; mv "C:\Program Files\WindowsPowerShell\Modules\Get-SLOC-master" "C:\Program Files\WindowsPowerShell\Modules\Get-SLOC"
   ```


5. Close the terminal and open a new one. Try the command by typing **Get-SLOC**.

