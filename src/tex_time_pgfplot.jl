function tex_time_pgfplot(systems; series=[EoM.name.(systems[1].sensors); EoM.name.(systems[1].actuators)], folder=systems[1].name, file="time.out", n=1:1:length(series), m=Int32.(zeros(length(series))), label="F:time", caption="", xlabel="Time [\\si{\\s}]", ylabel="Outputs", name="Time history", short_name=name, skip=1, black=true, width=1.0)

    ##function tex_time_pgfplot(outs;folder="output",file="time.out",label="F:time",n=1:1:length(outs),m=Int32.(zeros(length(outs))),caption="",xlabel="Time [\\si{\\s}]",ylabel="Outputs",name="Time history",short_name=name,skip=1,black=true,width=1.0)
    ## Copyright (C) 2019, Bruce Minaker
    ## tex_time_pgfplot.jl is free software; you can redistribute it and/or modify it
    ## under the terms of the GNU General Public License as published by
    ## the Free Software Foundation; either version 2, or (at your option)
    ## any later version.
    ##
    ## tex_time_pgfplot.jl is distributed in the hope that it will be useful, but
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
    s *= "\\begin{axis}[height=3in,width=5in,xmin=0,enlarge x limits=false,"
    s *= "each nth point=$skip,filter discard warning=false,unbounded coords=discard,"
    s *= "xlabel={$xlabel},ylabel={$ylabel},"
    if black
        c = "black,"
        s *= "cycle list name=linestyles*,"
    else
        c = ""
        s *= "cycle list name=color list,"
    end
    s *= "legend style={at={(1.0,1.03)},anchor=south east},legend columns=-1]\n"
    for j = 1:length(n)
        s *= "\\addplot+[$(c)line width=$(width)pt,mark=none] table[x index=$(m[j]),y index=$(n[j])]{$folder/$file};\n"
        s *= "\\addlegendentry{\$$(series[j])\$}\n"
    end
    s *= "\\end{axis}\n"
    s *= "\\end{tikzpicture}\n"
    s *= "\\end{footnotesize}\n"
    s *= "\\end{center}\n"
    s *= "\\caption[$short_name]{\\textit{$name.} $caption}\n"
    s *= "\\label{$label}\n"
    s *= "\\end{figure}\n"
    #s*="\\clearpage\n\n"

    s

end ## Leave

##y filter/.code={\\pgfmathparse{(2*(#1>0)-1)*max(abs(#1),0.001)/(abs(#1)>0.001)}\\pgfmathresult}
