$sourceFolder = "C:\Users\Ashish\Pictures\p"
$destinationFolder = "C:\Users\Ashish\Pictures\Phone Photos"

# Create the destination folders if they don't already exist
if (!(Test-Path -Path "$destinationFolder\Photos")) {
  New-Item -ItemType Directory -Path "$destinationFolder\Photos"
}
if (!(Test-Path -Path "$destinationFolder\Videos")) {
  New-Item -ItemType Directory -Path "$destinationFolder\Videos"
}

# Get all the files in the source folder
$files = Get-ChildItem -Path $sourceFolder -Recurse

# Iterate through the files and move them to the appropriate destination folder
foreach ($file in $files) {
  if ($file.Extension -eq ".jpg" -or $file.Extension -eq ".jpeg" -or $file.Extension -eq ".png") {
    # Move the file to the Photos folder
    Move-Item -Path $file.FullName -Destination "$destinationFolder\Photos"
  } elseif ($file.Extension -eq ".mp4" -or $file.Extension -eq ".avi" -or $file.Extension -eq ".mov") {
    # Move the file to the Videos folder
    Move-Item -Path $file.FullName -Destination "$destinationFolder\Videos"
  }
}
