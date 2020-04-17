function tex_eig_pgftable(;folder="output",label="T:eigen",caption="",name="Eigenvalues",short_name=name)
## Copyright (C) 2017 Bruce Minaker
## tex_eig_table.jl is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 2, or (at your option)
## any later version.
##
## tex_eig_table.jl is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
## General Public License for more details at www.gnu.org/copyleft/gpl.html.
##
##--------------------------------------------------------------------

s="\\begin{table}[hbtp]\n"
s*="\\caption[$short_name]{\\textit{$name.} $caption}\n"
s*="\\begin{center}\n"
s*="\\begin{footnotesize}\n"
s*="\\pgfplotstabletypeset[%\n"
s*="columns={num,real,imag,nfreq,zeta,tau,lambda}]{$folder/eigen.out}\n"
s*="\\end{footnotesize}\n"
s*="\\end{center}\n"
s*="\\end{table}\n\n"

s

end  ## Leave
