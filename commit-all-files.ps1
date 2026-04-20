# Script to commit each file individually
# This will create one commit per file to increase commit count

Write-Host "Starting individual file commits..." -ForegroundColor Green
Write-Host ""

# Get all untracked files
$files = git ls-files --others --exclude-standard

if ($files.Count -eq 0) {
    Write-Host "No untracked files found!" -ForegroundColor Yellow
    exit
}

$totalFiles = ($files | Measure-Object).Count
$currentFile = 0

Write-Host "Found $totalFiles files to commit" -ForegroundColor Cyan
Write-Host ""

foreach ($file in $files) {
    $currentFile++
    
    # Show progress
    Write-Host "[$currentFile/$totalFiles] Committing: $file" -ForegroundColor Yellow
    
    # Add the file
    git add $file
    
    # Create commit message based on file
    $fileName = Split-Path $file -Leaf
    $commitMessage = "Add $fileName"
    
    # Commit the file
    git commit -m $commitMessage | Out-Null
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host "  Success" -ForegroundColor Green
    } else {
        Write-Host "  Failed" -ForegroundColor Red
    }
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "All files committed!" -ForegroundColor Green
Write-Host "Total commits created: $totalFiles" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "To push to remote run git push origin main" -ForegroundColor Yellow
