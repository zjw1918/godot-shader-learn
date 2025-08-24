shader_type canvas_item;

group_uniforms progress_dmg;
uniform sampler2D blood_noise: repeat_enable;
uniform sampler2D blood_grad: repeat_enable;
uniform float dmg_progress: hint_range(0.0, 1.0) = 1;
group_uniforms;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec4 noise_tex = texture(blood_noise, UV);
	vec4 blood_tex = texture(blood_grad, UV);
	
	vec4 mixed_blood_tex = mix(noise_tex, blood_tex, noise_tex.r);
	vec4 mixed_tex = mix(COLOR, mixed_blood_tex, noise_tex.r);
	
	COLOR.rgb = mix(COLOR, mixed_tex, dmg_progress).rgb;
	
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
