const rl        = @import("raylib");
const renderer  = @import("renderer.zig");
const in_out    = @import("input_output.zig");
const scene     = @import("scene.zig");

pub fn main() !void {

    const screenWidth = 1080;
    const screenHeight = 720;

    var main_scene: scene.Scene = .{
        .camera_3d = undefined,
        .flags = .{
            .free_look = true
        }
    };

    rl.setConfigFlags(.{.window_resizable = true});
    rl.initWindow(screenWidth, screenHeight, "kinematics visualizer zig");
    defer rl.closeWindow();

    renderer.render_setup(scene.get_renderer_context(&main_scene));

    rl.disableCursor();
    rl.setExitKey(.null);

    while (!rl.windowShouldClose()) {
        in_out.handle_keys(scene.get_input_output_context(&main_scene));
        renderer.render(scene.get_renderer_context(&main_scene));
    }
}
