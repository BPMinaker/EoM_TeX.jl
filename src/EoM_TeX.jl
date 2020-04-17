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
export tex_equil_pgftable
export tex_mass_props_pgftable
export tex_joint_props_pgftable
export tex_eqn
export tex_state_space

include("write_report.jl")
include("tex_bode_pgfplot.jl")
include("tex_bode3_pgfplot.jl")
include("tex_eig_pgfplot.jl")
include("tex_eig_pgftable.jl")
include("tex_sstf_pgfplot.jl")
include("tex_sstf_pgftable.jl")
include("tex_time_pgfplot.jl")
include("tex_equil_pgftable.jl")
include("tex_mass_props_pgftable.jl")
include("tex_joint_props_pgftable.jl")
include("tex_eqn.jl")
include("tex_state_space.jl")


end
