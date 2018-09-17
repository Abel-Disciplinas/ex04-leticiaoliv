using Plots
gr(size=(600,400))

include("bisseccao.jl")

function tests()
    funcoes = [  (x -> 2x - 3, 0 , 5),
                (x -> x^2 - 2, 1 , 2),
                (x -> x * exp(x) - 1, 0, 1),
                (x -> x^4 - 16, 0, 4),
                (x -> sin(1/x), 10e-8,10e-2), #Abel
                (x -> 27x^2 - 1/2, -1/3, 0),
                (x -> sin(3x) - 2x, 10e-2, 1/2),
                (x -> 3 * exp(x) - 5, 0, 1), #Leticia
                (x -> 2000*x -1, 10e-5, 10e-2),
                (x -> cos(x^10), -1.25, -1), #Dida
                (x -> (cos(x))^3 * exp(x) + 7, 2, 3),
                (x -> log(x + π), -3, 0),
                (x -> (x^2 - 1) * sin(4x^2), 0.5, 1), #Gustavo
                (x -> x^17 + x^9 + x^2018, -1, 1),
                (x -> exp(sin(x)) - 1, 0, 5),
                (x -> 5 * exp(sin(x)) - 10, 0, 2)] #Jaque
    for i = 1:length(funcoes)
        (f, a, b) = funcoes[i]
        x, fx, k = bissecao(f, a, b, :bisseccao)
        println("Exemplo $i Bissecção")
        println("x = $x")
        println("fx = $fx")
        println("iterações = $k")
        x, fx, k = bissecao(f, a, b, :esquerda)
        println("Exemplo $i Esquerda")
        println("x = $x")
        println("fx = $fx")
        println("iterações = $k")
        x, fx, k = bissecao(f, a, b, :direita)
        println("Exemplo $i Direita")
        println("x = $x")
        println("fx = $fx")
        println("iterações = $k")
        x, fx, k = bissecao(f, a, b, :aleatorio)
        println("Exemplo $i Aleatório")
        println("x = $x")
        println("fx = $fx")
        println("iterações = $k")
        x, fx, k = bissecao(f, a, b, :falsa_posicao)
        println("Exemplo $i Falsa Posição")
        println("x = $x")
        println("fx = $fx")
        println("iterações = $k")
    end
end

tests()
