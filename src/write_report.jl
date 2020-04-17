function write_report(;title="Title",folder="output",content=["" "" "" ""],data="data",verbose=false,build=true,clean=true)
## Copyright (C) 2017, Bruce Minaker
## write_report.jl is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 2, or (at your option)
## any later version.
##
## write_report.jl is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
## General Public License for more details at www.gnu.org/copyleft/gpl.html.
##
##--------------------------------------------------------------------

verbose && println("Writing report...")

src=joinpath(dirname(pathof(EoM_TeX)),"tex")
list=readdir(src)
for i in list
	if ~isfile(joinpath(folder,i))
		cp(joinpath(src,i),joinpath(folder,i))  ## fill output folder
	end
end

rprt="\\title{\nEoM Analysis\\\\\n$title\n\\\\\n}\n"
rprt*="\\author{\nJohn Smith: ID 12345678\n\\\\\n"
rprt*="Jane Smith: ID 87654321\n\\\\\n}\n"
rprt*="\\begin{titlingpage}\n"
rprt*="\\vspace*{-0.35in}\n"
rprt*="\\hspace{-1.05in}\n"
rprt*="\\includegraphics[height=1.1in]{uwlogo}\n"
rprt*="\\begin{center}\n"
rprt*="\\vspace{1.5in}\n"
rprt*="\\LARGE\n"
rprt*="\\thetitle\n"
rprt*="\\vspace{2in}\n"
rprt*="\\large\n"
rprt*="\\theauthor\n"
rprt*="\\vspace{1in}\n"
rprt*="\\today\n"
rprt*="\\vfill\n"
rprt*="\\end{center}\n"
rprt*="\\end{titlingpage}\n"
out=joinpath(folder,"titlepage.tex")
open(out,"w") do handle
	write(handle,rprt)
end

rprt="\\chapter{Introduction}\n"

if length(content[1])>0
	rprt*=content[1]
else
	rprt*="Replace this text with the introduction of your report.  Add sections or subsections as appropriate.\n"
end
out=joinpath(folder,"introduction.tex")
open(out,"w") do file
	write(file,rprt)
end

rprt="\\chapter{Analysis}\n"
if length(content[2])>0
	rprt*=content[2]
else
	rprt*="Replace this text with the body of your report.  Add sections or subsections as appropriate.\n"
end
out=joinpath(folder,"analysis.tex")
open(out,"w") do file
	write(file,rprt)
end

rprt="\\chapter{Conclusions}\n"
if length(content[3])>0
	rprt*=content[3]
else
	rprt*="Replace this text with the body of your report.  Add sections or subsections as appropriate.\n"
end
out=joinpath(folder,"conclusions.tex")
open(out,"w") do file
	write(file,rprt)
end



rprt="\\chapter{Equations of Motion}\n"
if length(content[4])>0
	rprt*=content[4]
end
out=joinpath(folder,"appendix.tex")
open(out,"w") do file
	write(file,rprt)
end

verbose && println("Report source written.")

@time if Sys.islinux() && build
	verbose && println("Running LaTeX...")
	try
		cmd="cd \"$(folder)\"; pdflatex -shell-escape -interaction batchmode report.tex > /dev/null"
		run(`bash -c $cmd`)
		run(`bash -c $cmd`)
		if clean
			cmd="cd \"$(folder)\"; rm *.lot *.lof *.log *.toc *.out *.aux *.auxlock"
			run(`bash -c $cmd`)
		end
	catch
		println("Error running pdflatex.  Skipping.")
	end
	verbose && println("LaTeX complete.")
end

end
