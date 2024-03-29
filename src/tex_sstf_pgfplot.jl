function tex_sstf_pgfplot(systems; ss = ones(Int64, length(system.sensors), length(system.actuators)), label="F:sstf", caption="", name="Steady state transfer functions", short_name=name)
    ## Copyright (C) 2017, Bruce Minaker
    ## tex_sstf_pgfplot.jl is free software; you can redistribute it and/or modify it
    ## under the terms of the GNU General Public License as published by
    ## the Free Software Foundation; either version 2, or (at your option)
    ## any later version.
    ##
    ## tex_sstf_pgfplot.jl is distributed in the hope that it will be useful, but
    ## WITHOUT ANY WARRANTY; without even the implied warranty of
    ## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
    ## General Public License for more details at www.gnu.org/copyleft/gpl.html.
    ##
    ##--------------------------------------------------------------------

    in_names = getfield.(systems[1].actuators, :name)
    out_names = getfield.(systems[1].sensors, :name)

    nin = length(in_names)
    nout = length(out_names)

    ins = 1:1:nin
    outs = 1:1:nout

    if size(ss, 1) > nout || size(ss, 2) > nin
        error("Steady state plot request dimensions are incompatible with system!")
    end

    s = "\\begin{figure}[htbp]\n"
    s *= "\\begin{center}\n"
    s *= "\\begin{footnotesize}\n"
    s *= "\\begin{tikzpicture}\n"
    s *= "\\begin{axis}[height=3in,width=5in,xmin=0,clip limits=false,enlarge x limits=false,"
    s *= "restrict y to domain=-10:10,"
    s *= "xlabel={Speed [\\si{\\m/\\s}]},ylabel=Steady state transfer functions,"
    s *= "legend style={at={(1.0,1.03)},anchor=south east},legend columns=-1,cycle list name=linestyles*]\n"
    for i in ins
        for j in outs
            if ss[j, i] == 1
                s *= "\\addplot+[black,line width=1pt,mark=none] table[x=vpt,y=$((i - 1) * nout + j)]{sstf.out};\n"
                s *= "\\addlegendentry{\$$(out_names[j])/$(in_names[i])\$}\n"
            end
        end
    end
    s *= "\\end{axis}\n"
    s *= "\\end{tikzpicture}\n"
    s *= "\\end{footnotesize}\n"
    s *= "\\end{center}\n"
    s *= "\\caption[$short_name]{$name. $caption}\n"
    s *= "\\label{$label}\n"
    s *= "\\end{figure}\n\n"

    s

end ## Leave
