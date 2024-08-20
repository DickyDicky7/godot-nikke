class_name StateNikke; extends State; @export var spine_sprite: SpineSprite; @export var area_3d: Area3D;

func      _ready() -> void:
    super._ready()        ;
    spine_sprite.hide()   ;
    pass;

func      _enter() -> void:
    super._enter()        ;
    spine_sprite.show()   ;
    pass;

func      _leave() -> void:
    super._leave()        ;
    spine_sprite.hide()   ;
    pass;
