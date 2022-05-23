function tex_bode_pgfplot(systems; ins = 1:1:length(systems[1].actuators), outs = 1:1:length(systems[1].sensors), folder::String = systems[1].name, label::String = "F:bode", caption::String = "", name::String = "Frequency response", short_name::String = name)
    ## Copyright (C) 2017, Bruce Minaker
    ## tex_bode_pgfplot.jl is free software; you can redistribute it and/or modify it
    ## under the terms of the GNU General Public License as published by
    ## the Free Software Foundation; either version 2, or (at your option)
    ## any later version.
    ##
    ## tex_bode_pgfplot.jl is distributed in the hope that it will be useful, but
    ## WITHOUT ANY WARRANTY; without even the implied warranty of
    ## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
    ## General Public License for more details at www.gnu.org/copyleft/gpl.html.
    ##
    ##--------------------------------------------------------------------

    in_names = EoM.name.(systems[1].actuators)
    out_names = EoM.name.(systems[1].sensors)
    vpts = EoM.vpt.(sys)

    nin = length(in_names)
    nout = length(out_names)
    nvpts = length(vpts)

    if nvpts > 1
        l = Int.(round.((nvpts - 1) .* [1, 3, 5, 7] / 8 .+ 1))
    else
        l = 1
    end

    s = "\\begin{figure}[hbtp]\n"
    s *= "\\begin{center}\n"
    s *= "\\begin{footnotesize}\n"
    s *= "\\begin{tikzpicture}\n"
    s *= "\\begin{semilogxaxis}[height=2in,width=5in,ymax=20,ymin=-40,clip limits=false,enlarge x limits=false,"
    s *= "ylabel={Transfer Function [\\si{\\decibel}]},"
    s *= "legend style={at={(1.0,1.03)},anchor=south east},legend columns=-1,legend cell align=left,cycle list name=linestyles*]\n"

    caps = []
    for i in ins  ## For each input
        for j in outs
            cap = "\$|$(out_names[j])|/|$(in_names[i])|\$"
            push!(caps, cap)
            for k in l
                s *= "\\addplot+[black,line width=1pt,mark=none] table[x=frequency,y=m$((i-1)*nout+j)]{$folder/bode_$k.out};\n"
                if nvpts > 1
                    s *= "\\addlegendentry{\$$(vpts[k])~\\si{\\m/\\s}\$}\n"
                else
                    s *= "\\addlegendentry{$cap}\n"
                end
            end
        end
    end

    s *= "\\end{semilogxaxis}\n"
    s *= "\\end{tikzpicture}\n"
    s *= "\\begin{tikzpicture}\n"
    s *= "\\begin{semilogxaxis}[height=1.5in,width=5in,ymin=-180,ymax=180,ytick={-180,-90,0,90,180},"
    s *= "xlabel={Frequency [\\si{\\hertz}]},ylabel={Phase Angle [\\si{\\degree}]},enlargelimits=false,cycle list name=linestyles*,"
    s *= "restrict y to domain= -180:180,unbounded coords=jump]\n"

    for i in ins
        for j in outs
            for k in l
                s *= "\\addplot+[black,line width=1pt,mark=none] table[x=frequency,y=p$((i-1)*nout+j)]{$folder/bode_$k.out};\n"
            end
        end
    end

    s *= "\\end{semilogxaxis}\n"
    s *= "\\end{tikzpicture}\n"
    s *= "\\end{footnotesize}\n"
    s *= "\\end{center}\n"
    s *= "\\caption[$short_name]{\\textit{$name.}"
    if nvpts > 1
        s *= " ("
        s *= join(caps, ", ")
        s *= ")"
    end
    s *= " $caption}\n"
    s *= "\\label{$label}\n"
    s *= "\\end{figure}\n\n"

    s

end ## Leave
