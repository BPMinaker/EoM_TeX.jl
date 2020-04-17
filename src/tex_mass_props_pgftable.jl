function tex_mass_props_pgftable(;folder="data",label="",caption="")
## Copyright (C) 2020 Bruce Minaker
## tex_props_table.jl is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 2, or (at your option)
## any later version.
##
## tex_props_table.jl is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
## General Public License for more details at www.gnu.org/copyleft/gpl.html.
##
##--------------------------------------------------------------------

s="\\begin{center}\n"
s*="\\begin{footnotesize}\n"
s*="\\pgfplotstabletypeset[%\n"
s*="begin table=\\begin{longtable},\n"
s*="end table=\\end{longtable},\n"
s*="every head row/.style={output empty row,\n"
s*="before row={\\caption{Body CG Locations and Mass}\\label{bodycoords}\\\\\n"
s*="\\toprule No. & Body Name &\n"
s*="\\multicolumn{6}{c}{Location [\\si{\\m}]} &\n"
s*="\\multicolumn{2}{c}{Mass [\\si{\\kg}]}\\\\},\n"
s*="after row=\\midrule},\n"
s*="columns={num,name,rx,ry,rz,mass}]{$folder/bodydata.out}\n"
s*="\\end{footnotesize}\n"
s*="\\end{center}\n\n"

s*="\\begin{center}\n"
s*="\\begin{footnotesize}\n"
s*="\\pgfplotstabletypeset[%\n"
s*="begin table=\\begin{longtable},\n"
s*="end table=\\end{longtable},\n"
s*="every head row/.style={output empty row,\n"
s*="before row={\\caption{Body Inertia Properties}\\label{bodyinertia}\\\\\n"
s*="\\toprule No. & Body Name &\n"
s*="\\multicolumn{12}{c}{Inertia\$^\\dagger\$ [\\si{\\kg.\\m^2}] (\$I_\\text{xx}\$, \$I_\\text{yy}\$, \$I_\\text{zz}\$; \$I_\\text{xy}\$, \$I_\\text{yz}\$, \$I_\\text{zx}\$)}\\\\},after row=\\midrule},\n"
s*="every last row/.style={after row=\\bottomrule \\multicolumn{14}{l}{\$^\\dagger\$Inertias are defined as the positive integral over the body.}\\\\\n"
s*="\\multicolumn{14}{l}{For example, \$I_{\\text{xy}}=+\\! \\int \\! r_\\text{x}r_\\text{y} \\,\\text{d}m \$.}},\n"
s*="columns={num,name,ixx,iyy,izz,ixy,iyz,ixz}]{$folder/bodydata.out}\n"
s*="\\end{footnotesize}\n"
s*="\\end{center}\n\n"

s

end  ## Leave
