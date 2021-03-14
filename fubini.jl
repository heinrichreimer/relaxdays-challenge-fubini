using Combinatorics
using LRUCache

const stirlings2_cache = Dict{Pair{Int, Int}, BigInt}()
 
function stirlings2(n::Int, k::Int)::BigInt
    if haskey(stirlings2_cache, Pair(n, k))
        return stirlings2_cache[Pair(n, k)]
    elseif n < 0
        throw(DomainError(n, "n must be nonnegative"))
    elseif n == k == 0
        return one(n)
    elseif n == 0 || k == 0
        return zero(n)
    elseif k == n - 1
        return binomial(n, 2)
    elseif k == 2
        return 2^(n - 1) - 1
    end
 
    result = k * stirlings2(n - 1, k) + stirlings2(n - 1, k - 1)
    stirlings2_cache[Pair(n, k)] = result
    return result
end
 

const factorial_cache = Dict{Int, BigInt}()

function cached_factorial(n::Int)::BigInt
    if haskey(factorial_cache, n)
        return factorial_cache[n]
    end

    result = factorial(BigInt(n))
    factorial_cache[n] = result
    return result
end
 

const fubini_cache = Dict{Int, BigInt}()

function fubini(n::Int)::BigInt
    if haskey(fubini_cache, n)
        return fubini_cache[n]
    end

    result = sum(cached_factorial(k) * stirlings2(n, k) for k in 0:n)
    fubini_cache[n] = result
    return result
end

function fubinis(n::Int)
    Channel{BigInt}(n) do ch
        for i in 1:n
            put!(ch, fubini(i))
        end
    end
end


function print_fubinis(n::Int)
    @time begin
        print("[")
        for i in 2:n
            if i > 1
                print(", ")
            end
            print(fubini(i))
        end
        print("]")
        println()
    end
end


if length(ARGS) < 1
    throw(ErrorException("Missing argument."))
end
n = parse(Int, ARGS[1])
print_fubinis(n)
