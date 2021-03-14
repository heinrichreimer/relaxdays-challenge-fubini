FROM julia:1.5

WORKDIR /app

RUN julia --eval 'using Pkg; Pkg.add("Combinatorics")'

COPY fubini.jl ./

ENTRYPOINT [ "julia", "fubini.jl" ]
