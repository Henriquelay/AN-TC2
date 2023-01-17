% Integrantes
% Henrique Layber
%

clc
printf ('Digite uma opçao:  \n')
printf ('1 - Resolver o  problema 1 (o exemplo da validaçao) \n')
printf ('2 - Resolver o problema 2 \n')
printf ('3 - Resolver o circuito RLC  \n')
printf ('4 - Resolver o sistema Massa-Mola  \n')
printf ('5 - Resolver o sistema Presa-predador  \n')
printf ('0 - Sair.\n')
op = input ('Escolha: ');

if (op == 1)% validação
    clc;
    % Sistema  PVI
    f1 = @ (x, y1, y2) y2;
    f2 = @ (x, y1, y2) 2 * y1 + y2 - x^2;
    a = 0;
    b = 1;
    y1a = 1;
    y2a = 0;
    %  Euler
    disp(' Resolvendo o problema de validação')
    % 0.25(e^(2x) + 2x^2 - 2x + 3)
    y1exactf = @(x) 0.25 * (exp(2 * x) + 2 * x^2 - 2 * x + 3);
    y2exactf = @(x) y1exactf(x);

    % Solving for m = 5
    m = 5;
    [X, Y1Euler, Y2Euler] = rk1(a, b, y1a, y2a, m, f1, f2)

    % Pre-processing for plotting
    y1exact = zeros(1, m + 1);
    y2exact = zeros(1, m + 1);
    h = (b - a) / m;

    for i = 0:m
        y1exact(i + 1) = y1exactf(a + (i) * h);
        y2exact(i + 1) = y2exactf(a + (i) * h);
    endfor

    % Plot y1 and y1exact at the same time on x from a to b
    plot(X, Y1Euler, 'b-o', 'linewidth', 2, 'displayname', 'y1', X, y1exact, 'g-+', 'linewidth', 2, 'markersize', 50, 'displayname', 'y1exact')
    grid
    xlabel('x')
    ylabel('y')
    legend('y1', 'y1exact')
    % Name for title
    title(cstrcat('Sol for y1 via Euler with m = ', num2str(m)));

    % wait 5 secs
    pause(5)

    % Plot y2 and y2exact at the same time on x from a to b
    plot(X, Y2Euler, 'b-o', 'linewidth', 2, 'displayname', 'y2', X, y2exact, 'g-+', 'linewidth', 2, 'markersize', 50, 'displayname', 'y2exact')
    grid
    xlabel('x')
    ylabel('y')
    legend('y2', 'y2exact')
    title(cstrcat('Sol for y2 via Euler with m = ', num2str(m)));

    % For m = 20
    m = 20;
    [X, Y1Euler, Y2Euler] = rk1(a, b, y1a, y2a, m, f1, f2)

endif

if (op == 2)
    clc;
    % IVP System
    f1 = @ (x, y1, y2) y1 + y2 + 3 * x;
    f2 = @ (x, y1, y2) 2 * y1 - y2 - x;
    a = 0;
    b = 1;
    y1a = 1;
    y2a = -1;
    %  Euler
    disp(' Resolvendo o problema 2')
    m = 20;
    [X, Y1Euler, Y2Euler] = rk1(a, b, y1a, y2a, m, f1, f2)

    % Plot y and yexact at the same time on x from a to b
    plot(X, Y1Euler, 'b-o', 'linewidth', 2, 'displayname', 'y1', X, Y2Euler, 'r-o', 'linewidth', 2, 'displayname', 'y2')
    grid
    xlabel('x')
    ylabel('y')
    legend('y1', 'y2')
    % Name for title
    title(cstrcat('Sol for y via Euler with m = ', num2str(m)));
endif

if (op == 3)%circuito
    % IVP System
    R1 = 4; % ohms
    C = 0.25; % farads
    R2 = 6; % ohms
    L = 1; % henrys
    V = 12; % volts

    % Kirchoff's laws
    I1f = @ (x, I1, I2) 12 - 4 * I1 + 4 * I2;
    I2f = @ (x, I1, I2) 4.8 - 1.6 * I1 - 1.2 * I2;

    % Initial conditions
    % Switch is initially open, so I1 = I2 = 0
    I1 = 0;
    I2 = 0;

    % Execution settings
    m = 60;
    a = 0;
    b = 6;

    % Solving
    [X, Y1Euler, Y2Euler] = rk1(a, b, I1, I2, m, I1f, I2f)

    % Plotting
    plot(X, Y1Euler, 'b-o', 'linewidth', 2, 'displayname', 'I1', X, Y2Euler, 'r-o', 'linewidth', 2, 'displayname', 'I2')
    grid
    xlabel('t (minutes)')
    ylabel('I (amperes)')
    legend('I1', 'I2')
    title(cstrcat('Sol for I via Euler with m = ', num2str(m)));
endif

if (op == 0)
    disp('  Até breve ! :-)')
endif

if (op == 4)%massa Mola
    % Sistema  PVI
    M = 20;
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
    %  Euler
    titulo= 'Sol via Euler Massa Mola Posicao em (azul)e (dy/dt em verde) ';
    [X, Y1, Y2] = rk1(a, b, y1a, y2a, m, f1, f2);
    % graficos
    % para y1 e y2
    plot(X, Y1, 'b-*', X(1), Y1(1), 'go', X, Y2, 'g-*', X(1), Y2(1), 'go')
    grid
    xlabel('x')
    ylabel('y ')
    legend('posicao', '(x(1), y1(1))', 'dy/dt', '(x(1), y2(1))')
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
    %  Euler
    titulo= 'Sol via Euler para sistema presa/Pred:  presa: y1(0)=16 ; Pred: y2(0)= 2';
    [X, Y1, Y2] = rk1(a, b, y1a, y2a, m, f1, f2);
    % graficos
    plot(X, Y1, 'b-*', X(1), Y1(1), 'bo', X, Y2, 'g-*', X(1), Y2(1), 'go')
    grid
    xlabel('x')
    ylabel('y')
    legend('Presa', '(x(1), y1(1))', 'Predador', '(x(1), y2(1))')
    title(titulo)
endif
