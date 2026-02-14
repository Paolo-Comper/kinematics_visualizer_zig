const rl = @import("raylib");

pub const Scene = struct {
    camera_3d: rl.Camera3D = undefined,
    flags: Flags,
};

pub const Flags = struct {
    free_look: bool = true,
};



//* === RENDERER CONTEXT ===

pub const RendererContext = struct {
    camera_3d: *rl.Camera3D,
    flags: *Flags,
};

pub fn get_renderer_context(scene: *Scene) RendererContext {
    return .{
        .camera_3d = &scene.camera_3d,
        .flags = &scene.flags,
    };
}



//* === INPUT_OUTPUT CONTEXT ===

pub const InputOutputContext = struct {
    camera_3d: *rl.Camera3D,
    flags: *Flags,
};

pub fn get_input_output_context(scene: *Scene) InputOutputContext {
    return .{
        .camera_3d = &scene.camera_3d,
        .flags = &scene.flags,
    };
}
