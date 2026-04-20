# PowerShell script to commit each file individually
# This script will iterate through all tracked files and commit them one by one

Write-Host "Starting individual file commits..." -ForegroundColor Green

# Get all tracked files
$files = git ls-files

# Counter for commits
$count = 0

# Loop through each file
foreach ($file in $files) {
    # Check if file exists
    if (Test-Path $file) {
        Write-Host "Committing: $file" -ForegroundColor Cyan
        
        # Stage the file
        git add $file
        
        # Commit the file with a descriptive message
        git commit -m "Add $file"
        
        # Increment counter
        $count++
    }
    else {
        Write-Host "Warning: $file not found, skipping..." -ForegroundColor Yellow
    }
}

Write-Host ""
Write-Host "Completed! Total files committed: $count" -ForegroundColor Green
Write-Host ""
Write-Host "To push changes to remote, run: git push origin main" -ForegroundColor Yellow
