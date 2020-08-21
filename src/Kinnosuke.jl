# ====================================================================
# Kinnosuke.jl : A lightweight toolbox for scientific machine learning
# Tianbai Xiao (c) 2020
# ====================================================================

module Kinnosuke

using OrdinaryDiffEq, Flux, DiffEqFlux, Optim
using FileIO, JLD2, Plots

include("diff.jl")
include("widget.jl")
include("train.jl")

export central_diff, central_diff!, upwind_diff, upwind_diff!
export track, device
export vis_train

end # module
