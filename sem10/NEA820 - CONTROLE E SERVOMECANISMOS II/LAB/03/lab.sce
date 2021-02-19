caminho = 'scilab/LAB_03/'
loadmatfile(caminho + 'vetores_posicao.mat')
// t_r, y_r_p_P, y_r_p_PD, y_r_p_Taco

show_window(0)
scf(0)
plot(t_r, y_r_p_P)
title('y_r_p_P')
xgrid(1)
xlabel('Tempo [s]')
ylabel('Tensão [V]')
xs2png(0, caminho + 'y_r_p_P')

show_window(1)
scf(1)
plot(t_r, y_r_p_PD)
title('y_r_p_PD')
xgrid(1)
xlabel('Tempo [s]')
ylabel('Tensão [V]')
xs2png(1, caminho + 'y_r_p_PD')

show_window(2)
plot(t_r, y_r_p_Taco)
title('y_r_p_Taco')
xgrid(1)
xlabel('Tempo [s]')
ylabel('Tensão [V]')
xs2png(2, caminho + 'y_r_p_Taco')

clear

caminho = 'scilab/LAB_03/'

loadmatfile(caminho + 'vetores_velocidade.mat')
// t_r, y_r_v_P, y_r_v_PI

show_window(3)
plot(t_r, y_r_v_P)
title('y_r_v_P')
xgrid(1)
xlabel('Tempo [s]')
ylabel('Tensão [V]')
xs2png(3, caminho + 'y_r_v_P')

show_window(4)
plot(t_r, y_r_v_PI)
title('y_r_v_PI')
xgrid(1)
xlabel('Tempo [s]')
ylabel('Tensão [V]')
xs2png(4, caminho + 'y_r_v_PI')

clear
