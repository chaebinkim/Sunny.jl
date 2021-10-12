module Sunny

using LinearAlgebra
using StaticArrays
using OffsetArrays
using SpecialFunctions
using Parameters
using FFTW
using Tullio
using ProgressMeter
import Random

const Vec3 = SVector{3, Float64}
const Mat3 = SMatrix{3, 3, Float64, 9}

include("Symmetry/Symmetry.jl")
export Crystal, nbasis, cell_volume, lattice_vectors, lattice_params
export Bond, print_bond_table, subcrystal, allowed_J
export all_symmetry_related_bonds, all_symmetry_related_bonds_for_atom
export all_symmetry_related_interactions, all_symmetry_related_interactions_for_atom

include("Util.jl")

include("Lattice.jl")

include("Interactions.jl")
export ExternalField, QuadraticInteraction, OnSiteQuadratic, DipoleDipole
export heisenberg, exchange, dm_interaction, onsite_anisotropy

include("PairInteractions.jl")

include("Ewald.jl")

include("FourierAccel.jl")

include("Hamiltonian.jl")

include("Systems.jl")
export ChargeSystem, SpinSystem, rand!, energy, field, field!

include("Metropolis.jl")
export MetropolisSampler, set_temp!, sample!, thermalize!, anneal!
export running_energy, running_mag

include("Integrators.jl")
export HeunP, LangevinHeunP, evolve!
export LangevinSampler

include("StructureFactors.jl")
export StructureFactor, update!, apply_dipole_factor, zero!
export dynamic_structure_factor, static_structure_factor

include("Plotting.jl")
export plan_spintraj_fft!
export plot_lattice, plot_spins, plot_bonds, plot_all_bonds
export anim_integration, live_integration, live_langevin_integration

end