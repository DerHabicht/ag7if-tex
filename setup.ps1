$TEXMFHOME = Join-Path $(kpsewhich -var-value TEXMFHOME) -ChildPath tex

# Packages
New-Item -Path "${TEXMFHOME}\ag7ifpub.sty" -ItemType SymbolicLink -Value .\sty\ag7ifpub.sty 
New-Item -Path "${TEXMFHOME}\fouo.sty" -ItemType SymbolicLink -Value .\sty\fouo.sty 
New-Item -Path "${TEXMFHOME}\infosec.sty" -ItemType SymbolicLink -Value .\sty\infosec.sty 
New-Item -Path "${TEXMFHOME}\tlp.sty" -ItemType SymbolicLink -Value .\sty\tlp.sty 
New-Item -Path "${TEXMFHOME}\usafpub.sty" -ItemType SymbolicLink -Value .\sty\usafpub.sty 

# Classes
New-Item -Path "${TEXMFHOME}\ag7ifbook.cls" -ItemType SymbolicLink -Value .\cls\ag7ifbook.cls 
New-Item -Path "${TEXMFHOME}\ag7ifcard.cls" -ItemType SymbolicLink -Value .\cls\ag7ifcard.cls 
New-Item -Path "${TEXMFHOME}\af7ifrfc.cls" -ItemType SymbolicLink -Value .\cls\ag7ifrfc.cls 
New-Item -Path "${TEXMFHOME}\usafmemo.cls" -ItemType SymbolicLink -Value .\cls\usafmemo.cls 
New-Item -Path "${TEXMFHOME}\usafpaper.cls" -ItemType SymbolicLink -Value .\cls\usafpaper.cls 