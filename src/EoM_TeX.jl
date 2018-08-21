#__precompile__()

module EoM_TeX

import EoM

export write_report

include("write_report.jl")
include(joinpath("tex","tex_bode_pgfplot.jl"))
include(joinpath("tex","tex_bode3_pgfplot.jl"))
include(joinpath("tex","tex_eig_pgfplot.jl"))
include(joinpath("tex","tex_eig_pgftable.jl"))
include(joinpath("tex","tex_hsv_pgfplot.jl"))
include(joinpath("tex","tex_hsv_pgftable.jl"))
include(joinpath("tex","tex_sstf_pgfplot.jl"))
include(joinpath("tex","tex_sstf_pgftable.jl"))

end
