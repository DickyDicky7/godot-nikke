class_name StateNikkeAim; extends StateNikke; @export var state_after_to_cover_animation: StateNikke; @export var nikke_jiggle_effect_resources_when_aim_fire: Array[NikkeJiggleEffectResource];

func      _ready() -> void:
    super._ready()        ;
    for nikke_jiggle_effect_resource: NikkeJiggleEffectResource in (
        nikke_jiggle_effect_resources_when_aim_fire                ):
        nikke_jiggle_effect_resource.node =    self                 ;
        nikke_jiggle_effect_resource.init()                         ;
        pass;
    pass;

func      _enter() -> void:
    super._enter()        ;
    self .spine_sprite.      get_animation_state().set_animation("aim_idle", true, 0);
    self .spine_sprite.animation_completed.connect(
      _on_spine_sprite_animation_completed        );
    self .area_3d.mouse_entered.connect(
      _on_area_3d_mouse_entered        );
    pass;

func      _leave() -> void:
    super._leave()        ;
    self .spine_sprite.animation_completed.disconnect(
      _on_spine_sprite_animation_completed           );
    self .area_3d.mouse_entered.disconnect(
      _on_area_3d_mouse_entered           );
    pass;

func      _on_spine_sprite_animation_completed(_spine_sprite: Object, _animation_state: Object, _track_entry: Object) -> void:
    if   (_track_entry.get_animation().get_name() == "to_cover"):
        self.change_state           (     state_after_to_cover_animation     );
        pass;
    elif (_track_entry.get_animation().get_name() ==
                      "aim_fire"):
        for nikke_jiggle_effect_resource: NikkeJiggleEffectResource in (
            nikke_jiggle_effect_resources_when_aim_fire                ):
            nikke_jiggle_effect_resource.         _do_jiggle();
            pass;
        pass;
    pass;

func                                        _on_area_3d_mouse_entered() -> void:
    self.spine_sprite.get_animation_state().set_animation("to_cover", false, 0);
    pass;

func      _input(_event: InputEvent) -> void:
    super._input(_event            )        ;
    pass;

func              _process(_delta: float) -> void:
    super.        _process(_delta       )        ;
    if   (Input.is_action_just_pressed ("PRESS")):
        self.spine_sprite.get_animation_state().set_animation("aim_fire", true, 0);
    elif (Input.is_action_just_released("PRESS")):
        self.spine_sprite.get_animation_state().set_animation("aim_idle", true, 0);
    pass;

func      _physics_process(_delta: float) -> void:
    super._physics_process(_delta       )        ;
    pass;
