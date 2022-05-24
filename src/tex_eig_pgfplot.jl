function tex_eig_pgfplot(; label::String = "F:eigen", caption::String = "", name::String = "Eigenvalues", short_name = name)
    ## Copyright (C) 2017, Bruce Minaker
    ## tex_eig_pgfplot.jl is free software; you can redistribute it and/or modify it
    ## under the terms of the GNU General Public License as published by
    ## the Free Software Foundation; either version 2, or (at your option)
    ## any later version.
    ##
    ## tex_eig_pgfplot.jl is distributed in the hope that it will be useful, but
    ## WITHOUT ANY WARRANTY; without even the implied warranty of
    ## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
    ## General Public License for more details at www.gnu.org/copyleft/gpl.html.
    ##
    ##--------------------------------------------------------------------

    ## Write the tex necessary to include the plots

    s = "\\begin{figure}[htbp]\n"
    s *= "\\begin{center}\n"
    s *= "\\begin{footnotesize}\n"
    s *= "\\begin{tikzpicture}\n"
    s *= "\\begin{axis}[reverse legend,height=3in,width=5in,xmin=0,clip limits=false,enlarge x limits=false,"
    s *= "restrict y to domain=-20:65,restrict expr to domain={abs(y)}{0.001:100},"
    s *= "xlabel={Speed [\\si{\\m/\\s}]},ylabel={Eigenvalue [\\si{\\radian/\\s}]},"
    s *= "legend style={at={(1.0,1.03)},anchor=south east},legend columns=-1]\n"
    s *= "\\addplot+[only marks,mark=*,mark options={black,fill=white,scale=1,line width=0.5pt}] table[x=vpt,y=imag]{eigen.out};\n"
    s *= "\\addplot+[only marks,mark=*,mark options={black,scale=0.6,line width=1pt}] table[x=vpt,y=real]{eigen.out};\n"
    s *= "\\legend{Imaginary, Real}\n"
    s *= "\\end{axis}\n"
    s *= "\\end{tikzpicture}\n"
    s *= "\\caption[$short_name]{$name. $caption}\n"
    s *= "\\label{$label}\n"
    s *= "\\end{footnotesize}\n"
    s *= "\\end{center}\n"
    s *= "\\end{figure}\n"
    #s*="\\clearpage\n\n"

    s

end ## Leave

##y filter/.code={\\pgfmathparse{(2*(#1>0)-1)*max(abs(#1),0.001)/(abs(#1)>0.001)}\\pgfmathresult}
