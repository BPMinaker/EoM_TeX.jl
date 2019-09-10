function tex_sstf_pgfplot(ins,outs;folder=".",label="F:sstf")
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

nin=length(ins)
nout=length(outs)
s=""  ## Write the tex necessary to include the plots

for i=1:nin
	s*="\\begin{figure}[htbp]\n"
	s*="\\begin{center}\n"
	s*="\\begin{footnotesize}\n"
	s*="\\begin{tikzpicture}\n"
	s*="\\begin{axis}[height=3in,width=5in,xmin=0,xlabel={Speed [\\si{\\m/\\s}]},ylabel=Steady state transfer functions,enlarge x limits=false,restrict y to domain=-10:10,legend style={at={(1.0,1.03)},anchor=south east},legend columns=-1,cycle list name=linestyles*]\n"
	for j=1:nout
		s*="\\addplot+[black,line width=1pt,mark=none] table[x=speed,y=$((i-1)*nout+j)]{$folder/sstf.out};\n"
		s*="\\addlegendentry{ $(outs[j]) / $(ins[i])}\n"
	end
	s*="\\end{axis}\n"
	s*="\\end{tikzpicture}\n"
	s*="\\end{footnotesize}\n"
	s*="\\end{center}\n"
	s*="\\caption[Steady state transfer functions]{Steady state transfer functions.}\n"
	s*="\\label{$(label)_$i}\n"
	s*="\\end{figure}\n\n"
end
#s*="\\clearpage\n\n"

s

end ## Leave
