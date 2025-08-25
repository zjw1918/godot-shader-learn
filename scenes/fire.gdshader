shader_type canvas_item;

uniform float UNIT_RANGE: hint_range(0.0, 1.0);
uniform sampler2D input_noise: repeat_enable;
uniform vec4 fire_c_a: source_color = vec4(1.0, 1.0, 0.0, 1.0);
uniform vec4 fire_c_b: source_color = vec4(1.0, 0.2, 0.0, 1.0);

void vertex() {
}

void fragment() {
	vec4 noise_tex = texture(input_noise, UV + TIME / 3.0);
	// move a bit left
	float n_scale = .06;
	vec4 heat_tex = texture(
		TEXTURE,
		vec2(UV.x + noise_tex.r * n_scale - n_scale / 2.0, UV.y)
	);

	vec4 fire_c = mix(fire_c_a, fire_c_b, noise_tex.r);

	//fire_c *= UV.y;
	// we need dense fire at the bottom, less dense at the top
	// 1. denser fire at the bottom
	// 2. make top fire more transparent
	float heat_fire_ratio = step(noise_tex.r, UV.y) * UV.y + .05;
	COLOR = mix(
		heat_tex,
		fire_c, heat_fire_ratio);
	// make coners round
	COLOR.a = heat_tex.a;
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
