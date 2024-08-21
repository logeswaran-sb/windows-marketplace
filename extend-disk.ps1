# Get the disk number where the C: partition is located
$partition = Get-Partition -DriveLetter C
$disk = $partition | Get-Disk

if ($disk -ne $null -and $partition -ne $null) {
    # Resize the partition to use the maximum available space
    $size = (Get-PartitionSupportedSize -DiskNumber $disk.Number -PartitionNumber $partition.PartitionNumber).SizeMax
    Resize-Partition -DiskNumber $disk.Number -PartitionNumber $partition.PartitionNumber -Size $size

    Write-Output "Disk extended successfully to the maximum size."
} else {
    Write-Output "Unable to find the disk or partition to extend."
}