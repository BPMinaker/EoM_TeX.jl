function tex_eqn(str;label="E:")
## Copyright (C) 2020 Bruce Minaker
## tex_eqn.jl is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 2, or (at your option)
## any later version.
##
## tex_eqn.jl is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
## General Public License for more details at www.gnu.org/copyleft/gpl.html.
##
##--------------------------------------------------------------------


s="\\begin{equation}"
s*=str
s*="\\end{equation}\n%\n"

s

end  ## Leave
