$TEXMFHOME = Join-Path $(kpsewhich -var-value TEXMFHOME) -ChildPath tex

# Packages
New-Item -Path "${TEXMFHOME}\fouo.sty" -ItemType SymbolicLink -Value .\sty\fouo.sty 
New-Item -Path "${TEXMFHOME}\usafpub.sty" -ItemType SymbolicLink -Value .\sty\usafpub.sty 

# Classes
New-Item -Path "${TEXMFHOME}\usafmemo.cls" -ItemType SymbolicLink -Value .\cls\usafmemo.cls 
New-Item -Path "${TEXMFHOME}\usafpaper.cls" -ItemType SymbolicLink -Value .\cls\usafpaper.cls 