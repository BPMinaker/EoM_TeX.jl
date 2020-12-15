function write_mtx_ptrn(file_name, mtx)

    n, m = size(mtx)

    str = "\\begin{tikzpicture}[every left delimiter/.style={xshift=1ex},every right delimiter/.style={xshift=-1ex}]\n"
    str *= "\\draw[help lines,xstep=3ex,ystep=3ex] (0ex,0ex) grid ($(m)ex,$(n)ex);\n"
    str *= "\\draw[help lines,thick,xstep=6ex,ystep=6ex] (0ex,0ex) grid ($(m)ex,$(n)ex);\n"
    str *= "\\matrix (name)[matrix anchor=south west,row sep={1ex,between origins},column sep={1ex,between origins},matrix of nodes,left delimiter={[},right delimiter={]},dot/.style={fill=black,circle,scale=0.2},empty/.style={fill=white,circle,scale=0.2}] at (-0.5ex,-0.5ex)\n"

    str *= "{\n"
    for i = 1:n
        for j = 1:m
            if j == m
                cc = "\\\\"
            else
                cc = "&"
            end
            if abs(mtx[i, j]) > 1e-6
                str *= "\\node[dot]{};" * cc
            else
                str *= "\\node[empty]{};" * cc
            end
        end
        str *= "\n"
    end
    str *= "};\n"

    str *= "\\node [left=0ex of name] {\$\\mathbf{A}=\$};\n"
    str *= "\\end{tikzpicture}\n"

    open(file_name, "w") do handle
        write(handle, str)
    end
end
