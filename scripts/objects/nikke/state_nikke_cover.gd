class_name StateNikkeCover; extends StateNikke; @export var state_after_to_aim_animation: StateNikke;

func      _ready() -> void:
    super._ready()        ;
    pass;

func      _enter() -> void:
    super._enter()        ;
    self.spine_sprite.      get_animation_state().set_animation("cover_idle", true, 0);
    self.spine_sprite.animation_completed.connect(
     _on_spine_sprite_animation_completed        );
    self.area_3d.mouse_exited.connect(
     _on_area_3d_mouse_exited        );
    pass;

func      _leave() -> void:
    super._leave()        ;
    self.spine_sprite.animation_completed.disconnect(
     _on_spine_sprite_animation_completed           );
    self.area_3d.mouse_exited.disconnect(
     _on_area_3d_mouse_exited           );
    pass;

func    _on_spine_sprite_animation_completed(_spine_sprite: Object, _animation_state: Object, _track_entry: Object) -> void:
    if (_track_entry.get_animation().get_name() == "to_aim"):
        self.change_state(   state_after_to_aim_animation  );
        pass;
    pass;

func          _on_area_3d_mouse_exited   () -> void:
    self.spine_sprite.get_animation_state().set_animation("to_aim", false, 0);
    pass;

func      _input(_event: InputEvent) -> void:
    super._input(_event);
    pass;

func              _process(_delta: float) -> void:
    super.        _process(_delta);
    pass;

func      _physics_process(_delta: float) -> void:
    super._physics_process(_delta);
    pass;
