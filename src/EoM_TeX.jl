##__precompile__()

module EoM_TeX
export setup
export tex_bode_pgfplot
export tex_bode3_pgfplot
export tex_eig_pgfplot
export tex_eig_pgftable
export tex_hsv_pgfplot
export tex_hsv_pgftable
export tex_sstf_pgfplot
export tex_sstf_pgftable


include("setup.jl")

include(joinpath("tex","tex_bode_pgfplot.jl"))
include(joinpath("tex","tex_bode3_pgfplot.jl"))
include(joinpath("tex","tex_eig_pgfplot.jl"))
include(joinpath("tex","tex_eig_pgftable.jl"))
include(joinpath("tex","tex_hsv_pgfplot.jl"))
include(joinpath("tex","tex_hsv_pgftable.jl"))
include(joinpath("tex","tex_sstf_pgfplot.jl"))
include(joinpath("tex","tex_sstf_pgftable.jl"))

end
