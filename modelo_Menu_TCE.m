% Integrantes
% Henrique Layber
%
clc
clear
printf ('Digite uma opçao:  \n')
printf ('1 - Resolver o  problema 1 (o exemplo da validaçao) \n')
printf ('2 - Resolver o problema 2 \n')
printf ('3 - Resolver ....  \n')
printf ('0 - Sair.\n')
op = input ('Escolha: ');

if (op == 1)%validação
    % Sistema  PVI
    clc;
    f1 = @ (x, y1, y2) y2;
    f2 = @ (x, y1, y2) 2 * y1 + y2 - x^2;
    disp(' Resolvendo o problema de validação')
    m = input ('qtos subintervalos (m)? ');
    disp(' Fazer...')
    %  Euler
    % A chamada do método de Euler para resolver o sistema seria feita aqui
    %  por exemplo, com o comando, abaixo (que está inativo obviamente pois vcs deverao implemntar)
    limit_low = 0;
    limit_high = 1;
    y1a = 1;
    y2a = 0;
    [X, Y1Euler, Y2Euler] = IVPEuler(limit_low, limit_high, y1a, y2a, m, f1, f2)

endif

if (op == 2)
    disp(' Fazer...')
endif

if (op == 3)%circuito
    disp(' Fazer...')
endif

if (op == 0)
    disp('  Até breve ! :-)')
endif

if (op == 4)%massa Mola
    % Sistema  PVI
    M = 20;
    c = 5
    c = 200
    k = 20;
    f1 = @ (x, y1, y2) y2;
    f2 = @ (x, y1, y2) (-k * y1 -c * y2) / M;
    a = 0.0;
    b = 40.0;
    y1a = 1.0;
    y2a = 0.0;
    %m = input ('qtos subintervalos (m)? ');
    m = 400;
    h = (b - a) / m
    X = zeros(1, m + 1);
    Y = zeros(1, m + 1);
    %  Euler
    titulo= 'Sol via Euler Massa Mola Posicao em (azul)e (dy/dt em verde) ';
    [X, Y1, Y2] = IVPEuler(a, b, y1a, y2a, m, f1, f2, titulo);
    % graficos
    % para y1
    plot(X, Y1, 'b*', X(1), Y1(1), 'bo', X, Y2, 'g+', X(1), Y2(1), 'go')
    %
    %para y2
    plot(X,Y2, 'b*', X(1),Y2(1), 'go')
    grid
    xlabel('x')
    ylabel('y ')
    title(titulo);
endif

if (op == 5)
    % Sistema  Presa Predador
    r = 1.4; alfa = 0.4; m = 0.65; delta = 0.1;
    f1 = @ (x, y1, y2) r * y1 -alfa * y1 * y2;
    f2 = @ (x, y1, y2) -m * y2 + delta * y1 * y2;
    % sol exata ?
    y1ex = @(x) 0
    y2ex = @(x) 0
    a = 0.0;
    b = 15;
    y1a = 16;
    y2a = 2;
    %m = input ('qtos subintervalos (m)? ');
    m = 240;
    h = (b - a) / m
    X = zeros(1, m + 1);
    Y = zeros(1, m + 1);
    %  Euler
    titulo= 'Sol via Euler para sistema presa/Pred:  presa: y1(0)=16 ; Pred: y2(0)= 2';
    [X, Y1, Y2] = IVPEuler(a, b, y1a, y2a, m, f1, f2, titulo);
    % graficos
    %{
    % para y1
    plot(X, Y1, 'b*', X(1), Y1(1), 'go')
    grid
    xlabel('x')
    ylabel('Predador ')
    title(titulo);
    %}
    %
    %para y2
    plot(X, Y2, 'b*', X(1), Y2(1), 'go')
    grid
    xlabel('x')
    ylabel('Predador ')
    title(titulo);
endif
