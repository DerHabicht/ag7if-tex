#!/bin/bash

REPO_DIR="$HOME/Repositories/Code/ag7if-tex/"

# Packages
ln -s "$REPO_DIR/sty/ag7ifform.sty" "$HOME/texmf/tex/ag7ifform.sty"
ln -s "$REPO_DIR/sty/ag7ifpub.sty" "$HOME/texmf/tex/ag7ifpub.sty"
ln -s "$REPO_DIR/sty/bibleref-ag7if.sty" "$HOME/texmf/tex/bibleref-ag7if.sty"
ln -s "$REPO_DIR/sty/fouo.sty" "$HOME/texmf/tex/fouo.sty"
ln -s "$REPO_DIR/sty/infosec.sty" "$HOME/texmf/tex/infosec.sty"
ln -s "$REPO_DIR/sty/tlp.sty" "$HOME/texmf/tex/tlp.sty"
ln -s "$REPO_DIR/sty/usafpub.sty" "$HOME/texmf/tex/usafpub.sty"

# Classes
ln -s "$REPO_DIR/cls/ag7ifbook.cls" "$HOME/texmf/tex/ag7ifbook.cls"
ln -s "$REPO_DIR/cls/ag7ifcard.cls" "$HOME/texmf/tex/ag7ifcard.cls"
ln -s "$REPO_DIR/cls/ag7ifform.cls" "$HOME/texmf/tex/ag7ifform.cls"
ln -s "$REPO_DIR/cls/ag7ifmemo.cls" "$HOME/texmf/tex/ag7ifmemo.cls"
ln -s "$REPO_DIR/cls/ag7ifref.cls" "$HOME/texmf/tex/ag7ifref.cls"
ln -s "$REPO_DIR/cls/bylaws.cls" "$HOME/texmf/tex/bylaws.cls"
ln -s "$REPO_DIR/cls/callsigns.cls" "$HOME/texmf/tex/callsigns.cls"
ln -s "$REPO_DIR/cls/contbook.cls" "$HOME/texmf/tex/contbook.cls"
ln -s "$REPO_DIR/cls/fileplan.cls" "$HOME/texmf/tex/fileplan.cls"
ln -s "$REPO_DIR/cls/oplan.cls" "$HOME/texmf/tex/oplan.cls"
ln -s "$REPO_DIR/cls/usafmemo.cls" "$HOME/texmf/tex/usafmemo.cls"
ln -s "$REPO_DIR/cls/usafpaper.cls" "$HOME/texmf/tex/usafpaper.cls"

# Bibliographies
ln -s "$REPO_DIR/bib/ag7if.bib" "$HOME/texmf/bibtex/bib/ag7if.bib"
ln -s "$REPO_DIR/bib/ag7if.bib" "$HOME/texmf/bibtex/bib/cap.bib"
ln -s "$REPO_DIR/bib/ag7if.bib" "$HOME/texmf/bibtex/bib/lhl.bib"
