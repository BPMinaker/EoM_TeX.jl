function tex_bode_pgfplot(systems, vpts; bode = ones(Int64, length(systems[1].sensors), length(systems[1].actuators)), label::String = "F:bode", caption::String = "", name::String = "Frequency response", short_name::String = name)
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

    in_names = getfield.(systems[1].actuators, :name)
    out_names = getfield.(systems[1].sensors, :name)

    nin = length(in_names)
    nout = length(out_names)
    nvpts = length(vpts)

    ins = 1:1:nin
    outs = 1:1:nout

    if size(bode, 1) > nout || size(bode, 2) > nin
        error("Bode plot request dimensions are incompatible with system!")
    end

    s = ""
    l = unique(Int.(round.((nvpts - 1) .* [1, 3, 5, 7] / 8 .+ 1)))
    ll = length(l)

    if ll == 1
        for i in ins  ## For each input
            r = findall(bode[:, i] .== 1)
            if length(r) > 0

                s *= "\\begin{figure}[hbtp]\n"
                s *= "\\begin{center}\n"
                s *= "\\begin{footnotesize}\n"
                s *= "\\begin{tikzpicture}\n"
                s *= "\\begin{semilogxaxis}[height=2in,width=5in,ymin=-40,clip limits=false,enlarge x limits=false,"
                s *= "ylabel={Transfer Function [\\si{\\decibel}]},"
                s *= "legend style={at={(1.0,1.03)},anchor=south east},legend columns=-1,legend cell align=left,cycle list name=linestyles*]\n"

                for j in outs
                    if bode[j, i] == 1
                        cap = "|$(out_names[j])|/|$(in_names[i])|"
                        s *= "\\addplot+[black,line width=1pt,mark=none] table[x=frequency1,y=m1]{bode_o$(j)_i$(i).out};\n"
                        s *= "\\addlegendentry{$cap}\n"
                    end
                end

                s *= "\\end{semilogxaxis}\n"
                s *= "\\end{tikzpicture}\n"

                s *= "\\begin{tikzpicture}\n"
                s *= "\\begin{semilogxaxis}[height=1.5in,width=5in,ymin=-360,ymax=0,ytick={-360,-270,-180,-90,0},"
                s *= "xlabel={Frequency [\\si{\\hertz}]},ylabel={Phase Angle [\\si{\\degree}]},enlargelimits=false,cycle list name=linestyles*,"
                s *= "restrict y to domain= -360:0,unbounded coords=jump]\n"

                for j in outs
                    if bode[j, i] == 1
                        s *= "\\addplot+[black,line width=1pt,mark=none] table[x=frequency1,y=p1]{bode_o$(j)_i$(i).out};\n"
                    end
                end

                s *= "\\end{semilogxaxis}\n"
                s *= "\\end{tikzpicture}\n"
                s *= "\\end{footnotesize}\n"
                s *= "\\end{center}\n"
                s *= "\\caption[$short_name]{$name. $caption}\n"
                s *= "\\label{$label}\n"
                s *= "\\end{figure}\n\n"
            end
        end
    else
        for i in ins  ## For each input
            for j in outs
                if bode[j, i] == 1
                    s *= "\\begin{figure}[hbtp]\n"
                    s *= "\\begin{center}\n"
                    s *= "\\begin{footnotesize}\n"
                    s *= "\\begin{tikzpicture}\n"
                    s *= "\\begin{semilogxaxis}[height=2in,width=5in,ymin=-40,clip limits=false,enlarge x limits=false,"
                    s *= "ylabel={Transfer Function [\\si{\\decibel}]},"
                    s *= "legend style={at={(1.0,1.03)},anchor=south east},legend columns=-1,legend cell align=left,cycle list name=linestyles*]\n"

                    for k in l
                        cap = "$(vpts[k])"
                        s *= "\\addplot+[black,line width=1pt,mark=none] table[x=frequency$k,y=m$k]{bode_o$(j)_i$(i).out};\n"
                        s *= "\\addlegendentry{$cap}\n"
                    end

                    s *= "\\end{semilogxaxis}\n"
                    s *= "\\end{tikzpicture}\n"

                    s *= "\\begin{tikzpicture}\n"
                    s *= "\\begin{semilogxaxis}[height=1.5in,width=5in,ymin=-360,ymax=0,ytick={-360,-270,-180,-90,0},"
                    s *= "xlabel={Frequency [\\si{\\hertz}]},ylabel={Phase Angle [\\si{\\degree}]},enlargelimits=false,cycle list name=linestyles*,"
                    s *= "restrict y to domain= -360:0,unbounded coords=jump]\n"

                    for k in l
                        s *= "\\addplot+[black,line width=1pt,mark=none] table[x = frequency$k,y = p$k]{bode_o$(j)_i$(i).out};\n"
                    end

                    s *= "\\end{semilogxaxis}\n"
                    s *= "\\end{tikzpicture}\n"
                    s *= "\\end{footnotesize}\n"
                    s *= "\\end{center}\n"
                    s *= "\\caption[$short_name]{$name |$(out_names[j])|/|$(in_names[i])|. $caption}\n"
                    s *= "\\label{$label}\n"
                    s *= "\\end{figure}\n\n"
                end
            end
        end
    end

    s

end ## Leave
