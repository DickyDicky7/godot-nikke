class_name StateNikkeStanding; extends StateNikke;

func      _input(_event: InputEvent) -> void:
    super._input(_event);
    pass;

func      _enter() -> void:
    super._enter()        ;
    self .spine_sprite.      get_animation_state().set_animation("idle", true, 0);
    self .spine_sprite.animation_completed.connect(
      _on_spine_sprite_animation_completed        );
    pass;

func      _leave() -> void:
    super._leave()        ;
    self .spine_sprite.animation_completed.disconnect(
      _on_spine_sprite_animation_completed           );
    pass;

func _on_spine_sprite_animation_completed(_spine_sprite: Object, _animation_state: Object, _track_entry: Object) -> void:
    if (_track_entry.             get_animation      ().get_name     (               ) == "action"):
                self.spine_sprite.get_animation_state().set_animation("idle", true, 0);
                pass;
    pass;

func              _process(_delta: float) -> void:
    super.        _process(_delta);
    if (Input.is_action_just_pressed("PRESS"))   :
         self.    spine_sprite.get_animation_state(
                             ).set_animation      (
                       "action", false, 0         );
         pass;
    pass;

func      _physics_process(_delta: float) -> void:
    super._physics_process(_delta);
    pass;
