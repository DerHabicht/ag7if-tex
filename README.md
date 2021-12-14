# AG7IF LaTeX Stuff

This is a repository of LaTeX classes and packages that I have created for
personal use over the years. I'm not sure I want to actually distribute them in
a formal repository (such as TeXLive), but they might be useful to someone
that's not me.

## The Stuff

### Classes

#### usafmemo
This class creates the US Air Force's Official Memorandum Format in its various
incarnations as described in chapter 14 of the Tongue and Quill (AFH 33-337).

#### usafletter
This is the Personal Letter format as described in chapter 15 the Tongue and
Quill (AFH 33-337).

#### usafpaper
This creates the various Air Force "papers" as described in chapter 16 of the
Tongue and Quill (AFH 33-337).

#### ag7ifrfc
Modification of `usafmemo` that I use for proposals or "Requests for Comment."

#### usaopord
Creates OPLAN/OPORD/WARNORD/FRAGORD documents as described by FM 5-0.

#### ag7ifman
Document class for personal manuals.

#### ag7ifpoi
Document class for Personal Operating Instructions (POI) based loosely on Civil
Air Patrol's Operating Instruction format.

#### ag7ifsop
Document class for personal Standard Operating Procedures (SOP).

### Packages

#### ag7ifpub
Publication formatting used by the `ag7ifman`, `ag7ifpoi`, and `ag7ifsop`
document classes.

#### usafpub
Formatting used by `usafmemo`, `usafletter`, and `usafpaper` classes. Supports
tweaks specific to the Civil Air Patrol as described in CAPP 1-2. Configurable
for non-USAF/CAP uses.

#### tlp
Creates Traffic Light Protocol markings on documents as prescribed by
[FIRST](https://www.first.org/tlp/). Also creates TLP cover sheets inspired by
the SF-703/704/705 cover sheets for classified information.

#### fouo
Creates U//FOUO markings in accordance with the Register and Manual. Includes
the U//FOUO coversheet created by the Federation of American Scientists. I have
consciously decided to not include support for marking higher classification
levels, since my packages **should not** be used for preparing classified
documents.

## License
Copyright (C) 2021  Robert Herschel Hawk

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.

## Contact
[robert@the-hawk.us]
