file_path="/sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode"
digit=$(<"$file_path")
result=$((digit ^ 1))
echo $result > "$file_path"
