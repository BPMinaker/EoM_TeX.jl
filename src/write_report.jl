function write_report(dir_output,the_system;verbose=false,dir_raw="unformatted")
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

input_names=broadcast(EoM.name,the_system[1].actuators)
output_names=broadcast(EoM.name,the_system[1].sensors)

#n=size(result[1].A,1)
nin=length(input_names)
nout=length(output_names)

src=joinpath(Pkg.dir(),"EoM_TeX","src","report")
list=readdir(src)
for i in list
	cp(joinpath(src,i),joinpath(pwd(),dir_output,i))  ## Create output folder date/time
end

tp="\\title{\nEoM Analysis\\\\\n$(the_system[1].name)\n\\\\\n}\n"
tp*="\\author{\nJohn Smith: ID 12345678\n\\\\\nJane Smith: ID 87654321\n\\\\\n}\n"
out=joinpath(dir_output,"titlepage.tex")
file=open(out,"w")
write(file,tp)
close(file)

rprt="\\chapter{Analysis}\n"
rprt*="Replace this text with the body of your report.  Add sections or subsections as appropriate.\n"

if(length(the_system)>1)
	rprt*=tex_eig_pgfplot() ## Plot the eigenvalues
	if(nin*nout<16)
		rprt*=tex_bode3_pgfplot(input_names,output_names)  ## Bode plots, but 3D
		rprt*=tex_sstf_pgfplot(input_names,output_names)  ## Plot the steady state results
		rprt*=tex_hsv_pgfplot()
	end
else
	rprt*=tex_eig_pgftable()

#	rprt*='There are ' num2str(result{1}.data.dimension-result{1}.eom.rigid.rkr) ' degrees of freedom.  '];
#	rprt*="There are $cmplx oscillatory modes, $dmpd damped modes, $nstbl unstable modes, and $rgd rigid body modes.\n\\pagebreak\n"

	if(nin*nout<16)
		rprt*=tex_bode_pgfplot(input_names,output_names)  ## Bode plots
	end

	rprt*=tex_sstf_pgftable()  ## Print the steady state results
	rprt*=tex_hsv_pgftable()
end
rprt*="\\input{load}"

out=joinpath(dir_output,"analysis.tex")
open(out,"w") do file
	write(file,rprt)
end

if(is_linux())

	verbose && println("Running LaTeX...")

	cmd="cd $(dir_output); /usr/bin/pdflatex -shell-escape -interaction batchmode report.tex"
	run(`bash -c $cmd`)
	run(`bash -c $cmd`)

end

end
