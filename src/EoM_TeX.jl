#__precompile__()

module EoM_TeX

import EoM

export write_report
export tex_bode_pgfplot
export tex_bode3_pgfplot
export tex_eig_pgfplot
export tex_eig_pgftable
export tex_sstf_pgfplot
export tex_sstf_pgftable
export tex_time_pgfplot
export clean_tex

include("write_report.jl")
include("tex_bode_pgfplot.jl")
include("tex_bode3_pgfplot.jl")
include("tex_eig_pgfplot.jl")
include("tex_eig_pgftable.jl")
include("tex_sstf_pgfplot.jl")
include("tex_sstf_pgftable.jl")
include("tex_time_pgfplot.jl")

function clean_tex(;folder=".")

for ext in [".lot",".lof",".log",".toc",".out",".aux"]
	files=readdir(folder)
	rm.(files[occursin.(ext,files)])
end

end

end
