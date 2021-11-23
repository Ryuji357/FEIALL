%{
1 - Upscaling seguido por DownScaling, pois o método aplicado no UpScaling desse projeto,
não gera perda de dados do original, mas o down scaling, independente do método,
gera perda de dados. Em teoria, aplicar upscaling seguido de downscaling na mesma proporção,
o resultado será identico ao original.

2 - Diferença entre escala da tela e a escala do video, se a diferença for: 
 - negativa: DownScaling
 - posição: UpScaling
%}