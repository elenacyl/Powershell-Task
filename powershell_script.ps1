# Interactive menu to select function to be carried out
function Show-Menu
{
     param (
           [string]$Title = 'Menu'
     )
     cls
     Write-Host "================ $Title ================"

     Write-Host "1: Press '1' to create a Local User."
     Write-Host "2: Press '2' to rename a Local User."
     Write-Host "3: Press '3' to remove a Local User."
     Write-Host "Q: Press 'Q' to quit."
}

# Function 1 - Create new local user
function New-User
{
  Try {
    $Fullname = Read-Host "Enter User's name"
    $Description = Read-Host "Enter account description"
    $Username = Read-Host "Enter username"
    $Password = Read-Host -AsSecureString "Enter password"
    New-LocalUser $Username -Password $Password -FullName $Fullname -Description $Description
    Write-Verbose "User created successfully"
  } Catch {
    Write-Host $_.Exception.Message
     # Write-Host "Unable to create local user. Please try again later."-ForegroundColor Red`n
  }
}

# Function 2 - Rename a local user
function Rename-User
{
  Try {
    $ExistingUser = Read-Host "Enter User to rename"
    $NewName = Read-Host "Enter new name"
    Rename-LocalUser -Name $ExistingUser -NewName $NewName
    Write-Verbose "User renamed successfully"
  } Catch {
    Write-Host $_.Exception.Message
    # Write-Host "Unable to rename local user. Please try again later." -ForegroundColor Red`n
  }
}

# Function 3 - Remove a local user
function Remove-User
{
  Try {
    $Username = Read-Host "Enter User to be removed"
    Remove-LocalUser -Name $Username
    Write-Verbose "User removed successfully"
  } Catch {
    Write-Host $_.Exception.Message
    # Write-Host "Unable to remove local user. Please try again later."-ForegroundColor Red`n
  }
}

# Main app to run
do
{
     Show-Menu
     $input = Read-Host "Please make a selection"
     switch ($input)
     {
           '1' {
                New-User
           } '2' {
                Rename-User
           } '3' {
                Remove-User
           } 'q' {
                return
           }
     }
     pause
}
until ($input -eq 'q')
