draw_self()

if (estado = "encantado") {
    gpu_set_blendmode(bm_add); // modo de adição (brilho)
    draw_sprite_ext(
        sprite_index,
        image_index,
        x,
        y,
        image_xscale,
        image_yscale,
        image_angle,
        make_color_rgb(255, 100, 100),
        2 // alpha (transparência)
    );
    gpu_set_blendmode(bm_normal); // volta ao normal
}