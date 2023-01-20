### A Pluto.jl notebook ###
# v0.19.18

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local iv = try Base.loaded_modules[Base.PkgId(Base.UUID("6e696c72-6542-2067-7265-42206c756150"), "AbstractPlutoDingetjes")].Bonds.initial_value catch; b -> missing; end
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : iv(el)
        el
    end
end

# ╔═╡ 3e893bf0-98d9-11ed-3f68-e907aab1b661
begin
	import Pkg
	Pkg.activate(mktempdir())
end


# ╔═╡ 0cc7d310-669b-4e6c-b82f-c668fa551343
begin
	Pkg.add(["MAT","PlutoUI","Plots"])
	using MAT, PlutoUI, Plots
end

# ╔═╡ c05eb933-0e7c-41d0-b569-db8ad216ab7c
md"""
## Experimentation on slider servers
"""

# ╔═╡ 20535b14-dcb0-484f-aa3d-37c6e789021a
md"""
Startup an environment:
"""

# ╔═╡ 1c73bbda-107e-4986-a9c6-5b6ac5b0b967
md"""
Add packages to read MAT files and use Julia sliders:
"""

# ╔═╡ cc68b929-135a-47b8-ba24-57142f9e2778
@bind fnum Slider(1:1:200, show_value = true)

# ╔═╡ f5ba9c98-d73e-4d69-9c6e-8c4a839a449d
fname = "simData/trajWtval" * string(fnum) *".mat"

# ╔═╡ 8220884b-a866-4446-a682-95e40557f9c0
md"""
Load all of the variables as a dict:
"""

# ╔═╡ b313cbe2-79dc-4491-89f3-aafa8af5f914
file = matopen(fname)
	

# ╔═╡ 5d14d20d-b924-4b78-a596-3a1a68ea12df
md"""
Display variable names in the dictionary:
To display all of the variables use:
varnames = names(file)
"""

# ╔═╡ 2ee2ed92-fb70-4e6b-aa71-0915bfdbf2aa
simdata = matread(fname)

# ╔═╡ 9a0077a8-a4c5-41b2-912c-1be5e2608740
begin
	p = Plots.plot(simdata["distance"]',simdata["duration"]')
	xlims!(0,.5)
	ylims!(0,3)
end

# ╔═╡ Cell order:
# ╟─c05eb933-0e7c-41d0-b569-db8ad216ab7c
# ╟─20535b14-dcb0-484f-aa3d-37c6e789021a
# ╠═3e893bf0-98d9-11ed-3f68-e907aab1b661
# ╟─1c73bbda-107e-4986-a9c6-5b6ac5b0b967
# ╠═0cc7d310-669b-4e6c-b82f-c668fa551343
# ╠═cc68b929-135a-47b8-ba24-57142f9e2778
# ╠═f5ba9c98-d73e-4d69-9c6e-8c4a839a449d
# ╟─8220884b-a866-4446-a682-95e40557f9c0
# ╠═b313cbe2-79dc-4491-89f3-aafa8af5f914
# ╟─5d14d20d-b924-4b78-a596-3a1a68ea12df
# ╠═2ee2ed92-fb70-4e6b-aa71-0915bfdbf2aa
# ╠═9a0077a8-a4c5-41b2-912c-1be5e2608740
