(Get-ChildItem "*.cs","*.sln","*.csproj","*.xaml" -Recurse | ForEach {
	$_.Name
	Get-Content $_
	""
} ) | Set-Content "a.txt"