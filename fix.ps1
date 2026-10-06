$files = Get-ChildItem -Recurse -File c:\Projects\vahaisinglepage -Include *.html,*.css
foreach ($f in $files) {
    $content = [System.IO.File]::ReadAllText($f.FullName, [System.Text.Encoding]::UTF8)
    
    $content = $content.Replace([char]0x00C2 + [char]0x00B7, [char]0x00B7)
    $content = $content.Replace([char]0x00E2 + [char]0x20AC + [char]0x201D, [char]0x2014)
    $content = $content.Replace([char]0x00E2 + [char]0x20AC + [char]0x201C, [char]0x2013)
    $content = $content.Replace([char]0x00C2 + [char]0x00A9, [char]0x00A9)
    $content = $content.Replace([char]0x00C3 + [char]0x00A0, [char]0x00E0)
    $content = $content.Replace([char]0x00C3 + [char]0x00A9, [char]0x00E9)
    $content = $content.Replace([char]0x00C3 + [char]0x00A8, [char]0x00E8)
    $content = $content.Replace([char]0x00C3 + [char]0x00AF, [char]0x00EF)
    $content = $content.Replace([char]0x00C3 + [char]0x00A7, [char]0x00E7)
    $content = $content.Replace([char]0x00C3 + [char]0x00AA, [char]0x00EA)
    $content = $content.Replace([char]0x00C3 + [char]0x00B4, [char]0x00F4)

    [System.IO.File]::WriteAllText($f.FullName, $content, [System.Text.Encoding]::UTF8)
}
