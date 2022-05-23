function tex_equil_pgftable(; folder::String = "output", label::String = "", caption::String = "")
    ## Copyright (C) 2020 Bruce Minaker
    ## tex_equil_table.jl is free software; you can redistribute it and/or modify it
    ## under the terms of the GNU General Public License as published by
    ## the Free Software Foundation; either version 2, or (at your option)
    ## any later version.
    ##
    ## tex_equil_table.jl is distributed in the hope that it will be useful, but
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
    s *= "before row={\\caption{System Static Deflections}\\label{deflns}\\\\\n"
    s *= "\\toprule No. & Body Name & Type &\n"
    s *= "\\multicolumn{6}{c}{Deflection [\\si{\\m}] or [rad]}\\\\},\n"
    s *= "after row=\\midrule}]{$folder/defln.out}\n"
    s *= "\\end{footnotesize}\n"
    s *= "\\end{center}\n\n"

    s *= "\\begin{center}\n"
    s *= "\\begin{footnotesize}\n"
    s *= "\\pgfplotstabletypeset[%\n"
    s *= "begin table=\\begin{longtable},\n"
    s *= "end table=\\end{longtable},\n"
    s *= "every head row/.style={output empty row,\n"
    s *= "before row={\\caption{System Preloads}\\label{preloads}\\\\\n"
    s *= "\\toprule No. & Connector Name & Type &\n"
    s *= "\\multicolumn{8}{c}{Load [\\si{\\N}] or [\\si{\\N\\m}] (Components; Magnitude)}\\\\},\n"
    s *= "after row=\\midrule}]{$folder/preload.out}\n"
    s *= "\\end{footnotesize}\n"
    s *= "\\end{center}\n"

    s

end  ## Leave
