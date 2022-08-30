$TEXMFHOME = $(kpsewhich -var-value TEXMFHOME)

# Packages
New-Item -Path "${TEXMFHOME}\tex\ag7ifform.sty" -ItemType SymbolicLink -Value .\sty\ag7ifform.sty 
New-Item -Path "${TEXMFHOME}\tex\ag7ifpub.sty" -ItemType SymbolicLink -Value .\sty\ag7ifpub.sty 
New-Item -Path "${TEXMFHOME}\tex\bibleref-ag7if.sty" -ItemType SymbolicLink -Value .\sty\bibleref-ag7if.sty 
New-Item -Path "${TEXMFHOME}\tex\fouo.sty" -ItemType SymbolicLink -Value .\sty\fouo.sty 
New-Item -Path "${TEXMFHOME}\tex\infosec.sty" -ItemType SymbolicLink -Value .\sty\infosec.sty 
New-Item -Path "${TEXMFHOME}\tex\tlp.sty" -ItemType SymbolicLink -Value .\sty\tlp.sty 
New-Item -Path "${TEXMFHOME}\tex\usafpub.sty" -ItemType SymbolicLink -Value .\sty\usafpub.sty 

# Classes
New-Item -Path "${TEXMFHOME}\tex\ag7ifbook.cls" -ItemType SymbolicLink -Value .\cls\ag7ifbook.cls 
New-Item -Path "${TEXMFHOME}\tex\ag7ifcard.cls" -ItemType SymbolicLink -Value .\cls\ag7ifcard.cls 
New-Item -Path "${TEXMFHOME}\tex\ag7ifform.cls" -ItemType SymbolicLink -Value .\cls\ag7ifform.cls 
New-Item -Path "${TEXMFHOME}\tex\ag7ifmemo.cls" -ItemType SymbolicLink -Value .\cls\ag7ifmemo.cls 
New-Item -Path "${TEXMFHOME}\tex\ag7ifref.cls" -ItemType SymbolicLink -Value .\cls\ag7ifref.cls 
New-Item -Path "${TEXMFHOME}\tex\bylaws.cls" -ItemType SymbolicLink -Value .\cls\bylaws.cls 
New-Item -Path "${TEXMFHOME}\tex\callsigns.cls" -ItemType SymbolicLink -Value .\cls\callsigns.cls 
New-Item -Path "${TEXMFHOME}\tex\oplan.cls" -ItemType SymbolicLink -Value .\cls\oplan.cls 
New-Item -Path "${TEXMFHOME}\tex\usafmemo.cls" -ItemType SymbolicLink -Value .\cls\usafmemo.cls 
New-Item -Path "${TEXMFHOME}\tex\usafpaper.cls" -ItemType SymbolicLink -Value .\cls\usafpaper.cls 

# Bibliographies
New-Item -Path "${TEXMFHOME}\bibtex\bib\ag7if.bib" -ItemType SymbolicLink -Value .\bib\ag7if.bib 
New-Item -Path "${TEXMFHOME}\bibtex\bib\cap.bib" -ItemType SymbolicLink -Value .\bib\cap.bib 
New-Item -Path "${TEXMFHOME}\bibtex\bib\lhl.bib" -ItemType SymbolicLink -Value .\bib\lhl.bib 
