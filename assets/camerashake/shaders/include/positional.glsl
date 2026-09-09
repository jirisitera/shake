// Always define SPEED and MAGNITUDE when using this code. Example:
// #define SPEED 3.0
// #define MAGNITUDE 0.002

#include <minecraft:globals.glsl>

uniform sampler2D InSampler;

layout(location = 0) in vec2 texCoord;

layout(std140) uniform SamplerInfo {
    vec2 InSize;
};

layout(location = 0) out vec4 fragColor;

void main() {
    float t = GameTime * 1200.0 * SPEED;
    vec2 offset = vec2(InSize.x / InSize.y, 1.0) * MAGNITUDE * vec2(
        sin(t * 15.3) * 0.5 + sin(t * 23.7) * 0.3 + sin(t * 41.1) * 0.2,
        cos(t * 12.1) * 0.5 + cos(t * 29.9) * 0.3 + cos(t * 37.8) * 0.2
    );
    fragColor = texture(InSampler, texCoord + offset);
}
