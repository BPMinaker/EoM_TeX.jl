function tex_state_space(;folder="output",systems="")
## Copyright (C) 2020, Bruce Minaker
## tex_state_space.jl is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 2, or (at your option)
## any later version.
##
## tex_state_space.jl is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
## General Public License for more details at www.gnu.org/copyleft/gpl.html.
##
##--------------------------------------------------------------------

## Write the tex necessary to include the eqns

appendix=[]
for i in systems
	push!(appendix,i[1].name)
end

rprt=""

for fldr in appendix

	rprt*="\\noindent For the model $fldr, the full state space equations are:\n"
	rprt*="\\[\n"
	rprt*="\\begin{bmatrix}\n"
	rprt*="{\\mathbf E} & {\\bm 0} \\\\ {\\bm 0} & {\\mathbf I}\n"
	rprt*="\\end{bmatrix}\n"
	rprt*="\\begin{Bmatrix}\n"
	rprt*="\\dot{\\bm x}\\\\ {\\bm y}\n"
	rprt*="\\end{Bmatrix}\n"
	rprt*="=\\begin{bmatrix}\n"
	rprt*="\\mathbf{A} & \\mathbf{B} \\\\ \\mathbf{C} & \\mathbf{D}\n"
	rprt*="\\end{bmatrix}\n"
	rprt*="\\begin{Bmatrix}\n"
	rprt*="{\\bm x}\\\\ {\\bm u}\\end{Bmatrix}\n"
	rprt*="\\]\n"

	for i in ["A","B","C","D","E"]
		rprt*=write_mtx(letter=i,data=folder,type="dss")
	end

	rprt*="\\noindent For the model $fldr, the reduced state space equations are:\n"
	rprt*="\\[\n"
	rprt*="\\begin{Bmatrix}\n"
	rprt*="\\dot{\\bm x}\\\\ {\\bm y}\n"
	rprt*="\\end{Bmatrix}\n"
	rprt*="=\\begin{bmatrix}\n"
	rprt*="\\mathbf{A} & \\mathbf{B} \\\\ \\mathbf{C} & \\mathbf{D}\n"
	rprt*="\\end{bmatrix}\n"
	rprt*="\\begin{Bmatrix}\n"
	rprt*="{\\bm x}\\\\ {\\bm u}\\end{Bmatrix}\n"
	rprt*="\\]\n"

	for i in ["A","B","C","D"]
		rprt*=write_mtx(letter=i,data=folder,type="ss")
	end
end

rprt

end ## Leave

function write_mtx(;letter="Q",type="dss",data="data")

rprt="\\setlength{\\tabcolsep}{2pt}\n"
rprt*="\\pgfplotstabletypeset[sci,sci e,sci zerofill,precision=4,dec sep align,\n"
rprt*="every head row/.style={output empty row},\n"
rprt*="every last row/.style={after row={}},\n"
rprt*="write to macro=\\$letter,\n"
rprt*="typeset=false]\n"
rprt*="{$data/$type/$letter.out}\n"
rprt*="\\begin{tiny}\n"
rprt*="\\[\n"
rprt*="{\\mathbf $letter}=\n"
rprt*="\\left[\n"
rprt*="\\$letter\n"
rprt*="\\right]\n"
rprt*="\\]\n"
rprt*="\\end{tiny}\n"

rprt

end
