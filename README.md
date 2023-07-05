# cylc.vim

**Vim plugin providing support for the Cylc language.**

[Cylc Website](https://cylc.org/) |
[Contributing](CONTRIBUTING.md) |
[Forum](https://cylc.discourse.group/) |
[![Chat](https://img.shields.io/matrix/cylc-general:matrix.org)](https://matrix.to/#/#cylc-general:matrix.org)


### Installation

It is recommended to install as a Vim package
(see [`:help packages`](https://vimhelp.org/repeat.txt.html#packages)):

```bash
mkdir -p ~/.vim/pack/vendor/start
cd ~/.vim/pack/vendor/start
git clone https://github.com/cylc/cylc.vim.git
```

Otherwise, use your favourite plugin manager, such as
[pathogen.vim](https://github.com/tpope/vim-pathogen).


### Usage

Cylc syntax is linked to standard vim highlighting groups, so should already be
consistent with any colour scheme.

Syntax-based folding is enabled; if you want to open files with folds initially
open, then add the following line to your vimrc:

```vim
set foldlevelstart=99
```


### Developing

Contributions welcome, read the [contributing](CONTRIBUTING.md) page and
add yourself to the contributors list with your first pull request.


### Copyright and Terms of Use

[![License](https://img.shields.io/github/license/cylc/cylc-flow.svg?color=lightgrey)](https://github.com/cylc/cylc-flow/blob/master/COPYING)

Copyright (C) 2008-<span actions:bind='current-year'>2023</span> NIWA & British Crown (Met Office) & Contributors.

Cylc is free software: you can redistribute it and/or modify it under the terms
of the GNU General Public License as published by the Free Software Foundation,
either version 3 of the License, or (at your option) any later version.

Cylc is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.  See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with
Cylc.  If not, see [GNU licenses](http://www.gnu.org/licenses/).
