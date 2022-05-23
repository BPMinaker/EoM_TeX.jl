function tex_joint_props_pgftable(; folder="data", label="", caption="")
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

    s = "\\begin{center}\n"
    s *= "\\begin{footnotesize}\n"
    s *= "\\pgfplotstabletypeset[%\n"
    s *= "begin table=\\begin{longtable},\n"
    s *= "end table=\\end{longtable},\n"
    s *= "every head row/.style={output empty row,\n"
    s *= "before row={\\caption{Connection Location and Direction}\\label{pointcoords}\\\\\n"
    s *= "\\toprule No. & Connection Name &\n"
    s *= "\\multicolumn{6}{c}{Location [\\si{\\m}]} & \\multicolumn{6}{c}{Unit Axis}\\\\},\n"
    s *= "after row=\\midrule}]{$folder/pointdata.out}\n"
    s *= "\\end{footnotesize}\n"
    s *= "\\end{center}\n\n"

    s *= "\\begin{center}\n"
    s *= "\\begin{footnotesize}\n"
    s *= "\\pgfplotstabletypeset[%\n"
    s *= "begin table=\\begin{longtable},\n"
    s *= "end table=\\end{longtable},\n"
    s *= "every head row/.style={output empty row,\n"
    s *= "before row={\\caption{Connection Properties}\\label{connectcoords}\\\\\n"
    s *= "\\toprule No. & Connection Name &\n"
    s *= "\\multicolumn{1}{c}{Stiffness [\\si{\\N/\\m}]} & \\multicolumn{1}{c}{Damping [\\si{\\N\\s/\\m}]}\\\\},\n"
    s *= "after row=\\midrule}, columns={num,name,stiffness,damping}]{$folder/stiffnessdata.out}\n"
    s *= "\\end{footnotesize}\n"
    s *= "\\end{center}\n"

    s

end  ## Leave




# \\begin{center}
# \\begin{footnotesize}
# \\pgfplotstabletypeset[%
# begin table=\\begin{longtable},
# end table=\\end{longtable},
# every head row/.style={output empty row,
# before row={\\caption{Connection Locations}\\label{linecoords}\\\\
# \\toprule No. & Connection Name &
# \\multicolumn{6}{c}{Location [\\si{\\m}]} & \\multicolumn{6}{c}{Location [\\si{\\m}]}\\\\},
# after row=\\midrule}]{linedata.out}
# \\end{footnotesize}
# \\end{center}
