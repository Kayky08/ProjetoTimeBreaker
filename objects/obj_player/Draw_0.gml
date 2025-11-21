//Desenhando o player com os efeitos
desenha_efeito_dano(desenha_efeito_mola)

if (estado = "encantado") {
    gpu_set_blendmode(bm_add); // modo de adição (brilho)
    draw_sprite_ext(
        sprite_index, // sprite que vai ser desenhado
        image_index, // imagem que vai ser desenhado
        x, // posição x
        y, // posição y
        image_xscale * 1.2, // tamanho da escala x
        image_yscale * 1.2, // tamanho da escala y
        image_angle, // angulo da imagem
        make_color_rgb(148, 241, 255), // cor da sprite
        0.5 // transparência
    );
    gpu_set_blendmode(bm_normal); // volta ao normal
}

if (estado = "paralizado") {
    gpu_set_blendmode(bm_add); // modo de adição (brilho)
    draw_sprite_ext(
        sprite_index, // sprite que vai ser desenhado
        image_index, // imagem que vai ser desenhado
        x, // posição x
        y, // posição y
        image_xscale * 1.2, // tamanho da escala x
        image_yscale * 1.2, // tamanho da escala y
        image_angle, // angulo da imagem
        make_color_rgb(255, 255, 0), // cor da sprite
        0.5 // transparência
    );
    gpu_set_blendmode(bm_normal); // volta ao normal
}

if (estado = "invertido") {
    gpu_set_blendmode(bm_add); // modo de adição (brilho)
    draw_sprite_ext(
        sprite_index, // sprite que vai ser desenhado
        image_index, // imagem que vai ser desenhado
        x, // posição x
        y, // posição y
        image_xscale * 1.2, // tamanho da escala x
        image_yscale * 1.2, // tamanho da escala y
        image_angle, // angulo da imagem
        make_color_rgb(255, 146, 110), // cor da sprite
        0.5 // transparência
    );
    gpu_set_blendmode(bm_normal); // volta ao normal
}