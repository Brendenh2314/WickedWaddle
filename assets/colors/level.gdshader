shader_type canvas_item;

uniform sampler2D gradient_texture;

void fragment() {
    // Flip the UV coordinates for vertical gradient
    vec2 uv = UV;
    uv.x = 1.0 - uv.x; // Flip x for horizontal to vertical mapping
    uv.y = uv.y; // Use y directly for vertical gradient
    COLOR = texture(gradient_texture, vec2(uv.y, uv.x));
}

void vertex() {
	// Called for every vertex the material is visible on.
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
