const std = @import("std");
const rl = @import("raylib");
const scene     = @import("scene.zig");

pub fn handle_keys(ctx: scene.InputOutputContext) void {
    const raw = @intFromEnum(rl.getKeyPressed());

    switch (std.meta.intToEnum(rl.KeyboardKey, raw) catch {std.debug.print("ERRORE KEY\n", .{});
        return;}) {
        .z => look_at_origin(ctx),
        .escape => disable_free_look(ctx),
        else => {},
    }


    if (rl.isMouseButtonPressed(.left) and !ctx.flags.free_look)
        enable_free_look(ctx);
}


fn disable_free_look(ctx: scene.InputOutputContext) void {
    rl.enableCursor();
    ctx.flags.free_look = false;
}

fn enable_free_look(ctx: scene.InputOutputContext) void {
    rl.disableCursor();
    ctx.flags.free_look = true;
}

fn look_at_origin(ctx: scene.InputOutputContext) void {
    ctx.camera_3d.target = .{.x =  0.0, .y =  0.0, .z =  0.0};
}
