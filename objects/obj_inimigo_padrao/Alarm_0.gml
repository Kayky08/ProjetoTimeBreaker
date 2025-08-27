//chamando o metodo atirar
atirar();

//chamando o alarme e definindo um tempo aleatório entre 1 e 2 segundos para atirar
alarm[0] = random_range(.5,2) * game_get_speed(gamespeed_fps);