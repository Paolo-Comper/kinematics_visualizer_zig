const rl = @import("raylib");
const scene     = @import("scene.zig");

pub fn render_setup(ctx: scene.RendererContext) void {

    rl.setTargetFPS(60);

    ctx.camera_3d.position   = .{.x = 10.0, .y = 10.0, .z = 10.0};
    ctx.camera_3d.target     = .{.x =  0.0, .y =  0.0, .z =  0.0};
    ctx.camera_3d.up         = .{.x =  0.0, .y =  1.0, .z =  0.0};
    ctx.camera_3d.fovy       =  45.0;
    ctx.camera_3d.projection = .perspective;
}

pub fn render(ctx: scene.RendererContext) void {
    rl.beginDrawing();
    defer rl.endDrawing();

    if (ctx.flags.free_look) rl.updateCamera(ctx.camera_3d, .free);

    rl.clearBackground(.dark_gray);

    render_3d(ctx);

    render_2d();
}

fn render_2d() void {

}

fn render_3d(ctx: scene.RendererContext) void {

    rl.beginMode3D(ctx.camera_3d.*);
    defer rl.endMode3D();

    rl.drawCube(.{.x = 0.0, .y = 0.0, .z = 0.0}, 2.0, 2.0, 2.0, .red);
    rl.drawCubeWires(.{.x = 0.0, .y = 0.0, .z = 0.0}, 2.0, 2.0, 2.0, .maroon);

    rl.drawGrid(10, 1.0);
}

