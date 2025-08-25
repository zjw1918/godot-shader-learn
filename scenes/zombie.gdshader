shader_type canvas_item;

uniform sampler2D grad_burn;
uniform sampler2D noise;
uniform float hp_left: hint_range(-2.0, 1.0);

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	float noise_r = texture(noise, UV).r;
	float transparent_y = UV.y + hp_left + noise_r;
	vec4 grad_tex = texture(
		grad_burn,
		vec2(UV.x, transparent_y)
	);
	float mix_ratio = clamp(UV.y + hp_left + noise_r, 0, 1);
	COLOR.rgb = mix(grad_tex.rgb, COLOR.rgb,  mix_ratio);
	COLOR.a = min(grad_tex.a, COLOR.a);
	
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
