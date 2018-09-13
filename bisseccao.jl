function bisseccao(f, a, b, estrategia; atol=1e-6, rtol=1e-6, max_iter=10_000)
    fa, fb = f(a), f(b)
    if abs(fa) < atol
        return a, fa, 0
    elseif abs(fb) < atol
        return b, fb, 0
    end
    if fa * fb > 0
        error("Hipóteses não satisfeitas")
    end
    ϵ = atol + rtol * (fa + fb) / 2
    x = (a + b) / 2
    fx = f(x)
    iter = 1
    while !(abs(fx) < ϵ || iter > max_iter)
        if fa * fx < 0
            b, fb = x, fx
        else
            a, fa = x, fx
        end
        x = (a + b) / 2
        fx = f(x)

        iter += 1
    end
    return x, fx, iter
end
