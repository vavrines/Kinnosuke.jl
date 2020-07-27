# ===============================================================
# Kinnosuke.jl : An elegant tool for scientific machine learning
# ===============================================================

module Kinnosuke

using OrdinaryDiffEq, Flux, DiffEqFlux, Optim
using FileIO, JLD2, Plots

include("widget.jl")
include("train.jl")

export track
export vis_train

end # module
